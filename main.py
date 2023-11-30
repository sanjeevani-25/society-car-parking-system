import os
from termcolor import colored

slots = input(colored("Enter number of parking slots : ",'green'))
slots_file = open("number_of_slots.v", "w")
slots_file.write("`define parking_slots "+ (slots-1))
slots_file.close()
os.system('cmd /c "iverilog -o clear_slots_out.vvp clear_slots.v"')
os.system('cmd /c "vvp clear_slots_out.vvp"')
os.system('cmd /c "python main2.py"')