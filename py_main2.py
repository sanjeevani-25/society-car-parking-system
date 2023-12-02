import py_modules as g
from termcolor import colored

def inp():
    num = input(colored("Reserved Parking Entry --> 0\nReserved Parking Exit --> 1\nGuest Parking Entry --> 2\nGuest Parking Exit --> 3\n",'yellow'))
    num=int(num)
    if(num==0):
        g.vehicle_entry()
    elif(num==1):
        g.vehicle_exit()
    elif(num==2 or num==3):
        g.guest_parking(num)
    else:
        print(colored('Enter appropriate value!','red'))
        inp()

inp()
g.clear_slot()
# open('output.txt', 'w').close()
# print("donee")
# guest parking