#!/bin/bash

MCU=atmega328p
SKETCH=Blink
SKETCH=BlinkWithoutDelay
ARDUINO=/usr/share/arduino/hardware/arduino/cores/arduino
PORT=/dev/ttyUSB0

CC=avr-gcc
CXX=avr-g++
CFLAGS="-c -g -Os -w -ffunction-sections -fdata-sections -mmcu=$MCU -DF_CPU=16000000L -DARDUINO=22"
CXXFLAGS="-c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -mmcu=$MCU -DF_CPU=16000000L -DARDUINO=22"
CINCLUDE="-I$ARDUINO"
OBJCOPY=avr-objcopy
OBJCOPYFLAGS1="-O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0"
OBJCOPYFLAGS2="-O ihex -R .eeprom"

AVRDUDE=/usr/share/arduino/hardware/tools/avrdude
AVRDUDE_CONF=/usr/share/arduino/hardware/tools/avrdude.conf
AVRDUDE_PROGRAMMER=stk500v1
AVRDUDE_WRITE_FLASH="-U flash:w:$SKETCH.hex:i"
UPLOAD_RATE=57600
AVRDUDE_FLAGS="-F -v -p $MCU -P $PORT -c $AVRDUDE_PROGRAMMER -b $UPLOAD_RATE -C $AVRDUDE_CONF"


mkdir -p build
cd build

function build()
{
$CXX $CXXFLAGS $CINCLUDE ../$SKETCH.cpp -o $SKETCH.o

for i in WMath.cpp main.cpp Tone.cpp Print.cpp WString.cpp HardwareSerial.cpp; do
	o=${i%.cpp}.o
	$CXX $CXXFLAGS $CINCLUDE $ARDUINO/$i -o $o
	avr-ar rcs core.a $o
done

for i in wiring_analog.c wiring_pulse.c wiring_shift.c wiring.c pins_arduino.c wiring_digital.c WInterrupts.c; do
	o=${i%.c}.o
	$CC $CFLAGS $CINCLUDE $ARDUINO/$i -o $o
	avr-ar rcs core.a $o
done

$CC -Os -Wl,--gc-sections -mmcu=$MCU $SKETCH.o core.a -L$PWD -lm -o $SKETCH.elf

$OBJCOPY $OBJCOPYFLAGS1 $SKETCH.elf $SKETCH.eep
$OBJCOPY $OBJCOPYFLAGS2 $SKETCH.elf $SKETCH.hex
}

function upload()
{
$AVRDUDE $AVRDUDE_FLAGS $AVRDUDE_WRITE_FLASH
}

[[ $1 ]] && DO=$1 || DO=build

$DO

