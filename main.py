import GUI as g
from termcolor import colored

def inp():
    num = input(colored("For Entry --> 1\nFor Exit --> 0\n",'green'))
    num=int(num)
    if(num==1):
        g.vehicle_entry()
    elif(num==0):
        g.vehicle_exit()
    else:
        print(colored('Enter appropriate value!','red'))
        inp()

slots = input(colored("Enter number of parking slots : ",'green'))
slots_file = open("number_of_slots.v", "w")
slots_file.write("`define parking_slots "+ slots)
slots_file.close()

g.init()
inp()
g.clear_slot()

# vehicle exit 

