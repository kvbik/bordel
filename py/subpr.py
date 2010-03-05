
import os
import sys
from subprocess import Popen, PIPE

print "python ahoj"
x = "echo shell ahoj; sleep 2; echo shell vole; sleep 2"
stdout = sys.stdout
stderr = sys.stderr
stdout = PIPE
stderr = PIPE
p = Popen(x, stdout=stdout, stderr=stderr, shell=True)
sts = os.waitpid(p.pid, 0)[1]
print "python vole"

