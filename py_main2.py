import py_modules as g
from termcolor import colored

def inp():
    num = input(colored("For Exit --> 0\nFor Entry --> 1\nFor Guest Parking --> 2\n",'yellow'))
    num=int(num)
    if(num==1):
        g.vehicle_entry()
    elif(num==0):
        g.vehicle_exit()
    elif(num==2):
        g.guest_parking()
    else:
        print(colored('Enter appropriate value!','red'))
        inp()

inp()
g.clear_slot()
print("donee")
# guest parking
# vehicle exit