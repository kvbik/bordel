// http://learn.adafruit.com/adafruit-neopixel-uberguide/arduino-library

#include <Adafruit_NeoPixel.h>

#define PIN 6

Adafruit_NeoPixel strip = Adafruit_NeoPixel(4*60, PIN, NEO_GRB + NEO_KHZ800);

// IMPORTANT: To reduce NeoPixel burnout risk, add 1000 uF capacitor across
// pixel power leads, add 300 - 500 Ohm resistor on first pixel's data input
// and minimize distance between Arduino and first pixel.  Avoid connecting
// on a live circuit...if you must, connect GND first.

void setup() {
  strip.begin();
  strip.show(); // Initialize all pixels to 'off'
}

void loop() {
  uint8_t wait = 25;

  strip.setBrightness(64);

  knightRider(strip.Color(127, 127, 127), wait); // white
  knightRider(strip.Color(255, 0, 0), wait);     // red
  knightRider(strip.Color(0, 255, 0), wait);     // green
  knightRider(strip.Color(0, 0, 255), wait);     // green
}

void knightRider(uint32_t c, uint8_t wait) {
  uint32_t b = strip.Color(0, 0, 0);

  for(uint16_t i=0; i<strip.numPixels(); i++) {
      strip.setPixelColor(i, c);
      strip.show();
      delay(wait);
      strip.setPixelColor(i, b);
      strip.show();
  }
  for(uint16_t i=strip.numPixels()-2; i>0; i--) {
      strip.setPixelColor(i, c);
      strip.show();
      delay(wait);
      strip.setPixelColor(i, b);
      strip.show();
  }
}
