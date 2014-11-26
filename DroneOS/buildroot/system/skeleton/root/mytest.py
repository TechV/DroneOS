#!/usr/bin/python
import time
from motor import motor
from RPIO import PWM
PWM.setup()
PWM.init_channel(0)
#where 17 is  GPIO17 = pin 11
# First we specify which gpio pins our motors are on and set our pwm accordingly
mymotor1 = motor('m1', 23, simulation=False)
mymotor2 = motor('m2', 17, simulation=False)
mymotor3 = motor('m3', 24, simulation=False)
mymotor4 = motor('m4', 4, simulation=False)
print('Motors set, press ENTER')
res = raw_input()

# Here we set each motor to 7, most esc's handle pairing by quickly
# increasing and decreasing throttle, this implements that. 
mymotor1.start()
mymotor1.setW(7)

mymotor2.start()
mymotor2.setW(7)

mymotor3.start()
mymotor3.setW(7)

mymotor4.start()
mymotor4.setW(7)
#NOTE:the angular motor speed W can vary from 0 (min) to 100 (max)

print('***Wait beep-beep')

print('***then press ENTER')
# here we throttle down to zero and wait for a longer beep to designate
# that our motors are all paired and ready for orders.
res = raw_input()
mymotor1.setW(0)
mymotor2.setW(0)
mymotor3.setW(0)
mymotor4.setW(0)

print('***Wait for long beeeeep')
print('***then press ENTER')
# My setup begins spining at a W level around 17 so we set baseline at 10
# You want this to be just under your minimum throttle level.
res = raw_input()
mymotor1.setW(10)

res = raw_input()
mymotor2.setW(10)

res = raw_input()
mymotor3.setW(10)

res = raw_input()
mymotor4.setW(10)
print ('increase W > q | decrease W > w | save Wh > e | set Wh > r | quit > 9 | cycle > c')

cycling = True
try:
    while cycling:
        res = raw_input()
        if res == 'q':
          mymotor1.increaseW(20)
          mymotor2.increaseW(20)
          mymotor3.increaseW(20)
          mymotor4.increaseW(20)
        if res == 'w':
            mymotor1.decreaseW(25)
            mymotor2.decreaseW(25)
            mymotor3.decreaseW(25)
            mymotor4.decreaseW(25)
        if res == 'e':
            mymotor1.saveWh()
            mymotor2.saveWh()
            mymotor3.saveWh()
            mymotor4.saveWh()
        if res == 'r':
            mymotor1.setWh()
            mymotor2.setWh()
            mymotor3.setWh()
            mymotor4.setWh()
        if res == 'c':
			# decrease by 100 since not all esc's can set W to zero after pairing
			mymotor1.decreaseW(100)
			mymotor2.decreaseW(100)
			mymotor3.decreaseW(100)
			mymotor4.decreaseW(100)
			# spin motor 1 for 10 seconds
			mymotor1.increaseW(25)
			time.sleep(10)
			#stop motor 1
			mymotor1.decreaseW(25)
			
			# spin motor 2 for 10 seconds
			mymotor2.increaseW(25)
			time.sleep(10)
			#stop motor 2
			mymotor2.decreaseW(25)

			# spin motor 3 for 10 seconds
			mymotor3.increaseW(25)
			time.sleep(10)
			#stop motor 3
			mymotor3.decreaseW(25)

			# spin motor 4 for 10 seconds
			mymotor4.increaseW(25)
			time.sleep(10)
			#stop motor 4
			mymotor4.decreaseW(25)
			
        if res == '9':
            cycling = False
finally:
    # shut down cleanly
    mymotor1.stop()
    mymotor2.stop()
    mymotor3.stop()
    mymotor4.stop()
    PWM.clear_channel_gpio(0, 23)
    PWM.clear_channel_gpio(0, 17)
    PWM.clear_channel_gpio(0, 22)
    PWM.clear_channel_gpio(0, 4)
    print ("well done!")


