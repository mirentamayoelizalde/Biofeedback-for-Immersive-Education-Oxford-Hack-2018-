import serial
import numpy as np

with serial.Serial('/dev/ttyACM0') as ser:
    while(True):
        print(ser.read())
