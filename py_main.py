import os
from termcolor import colored

open('output.txt', 'w').close()
slots = int(input(colored("Enter number of parking slots : ",'magenta')))
guest_slots = int(input(colored("Enter number of guest parking slots : ",'magenta')))
slots_file = open("number_of_slots.v", "w")
slots_file.write("`define parking_slots "+ str((slots-1))+"\n")
slots_file.write("`define guest_slots "+ str(guest_slots))
slots_file.close()
os.system('cmd /c "iverilog -o clear_slots_out.vvp clear_slots.v"')
os.system('cmd /c "vvp clear_slots_out.vvp"')
os.system('cmd /c "python py_main2.py"')