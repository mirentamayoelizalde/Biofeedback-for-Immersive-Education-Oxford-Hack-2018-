import serial
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

b = []
i = 0
ys = []
with serial.Serial('/dev/ttyACM0') as ser:
    print(ser.name)
    for i in range(0,4840000):
        if ser.inWaiting() > 0:
            b.append(ser.read())

conv = lambda b : int.from_bytes(b, byteorder='big')
vconv = np.vectorize(conv)

ys = vconv(b)
xs = range(0,len(ys))

s = []
byte = []
for i in range(0, len(b)):
    current = int.from_bytes(b[i], byteorder='big') 
    if current != 10 and current != 13:
        byte.append(current)
    elif byte != []:
        s.append(byte)
        byte = []

output = []
for j in range(0, len(s)):
    out = ''
    for k in range(0,len(s[j])):
        out += str(chr(s[j][k]))
    output.append(int(out))


xs = range(0, len(output))
plt.plot(xs, output)
plt.show()

df = pd.DataFrame()
df['sequential'] = xs
df['reading'] = output
name = "light.csv"
df.to_csv(path_or_buf = ("./" + name))



