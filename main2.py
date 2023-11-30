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

inp()
g.clear_slot()

# guest parking
# vehicle exit