import os
from termcolor import colored

def vehicle_entry():
    flat_number = input("Enter Your Flat Number : ")
    password = input("Enter Your Password : ")

    def DecimalToBinary(n):
        return bin(n).replace("0b", "")


    flat_number_binary = DecimalToBinary(int(flat_number))
    pwd_binary = DecimalToBinary(int(password))

    print(flat_number_binary, password)

    file = open("input.txt", "w")
    file.write(flat_number_binary + " " + pwd_binary)
    file.close()

    os.system('cmd /c "iverilog -o main_out.vvp main.v"')
    os.system('cmd /c "vvp main_out.vvp"')

def vehicle_exit():
    print("vehicle exited")

def clear_slot():
    clear_all_slots = input("Do you want to clear all slots? (Y/N)")

    if(clear_all_slots=='Y' or clear_all_slots=='y'):
        print(colored("Cleared",'blue'))
        os.system('cmd /c "iverilog -o clear_slots_out.vvp clear_slots.v"')
        os.system('cmd /c "vvp clear_slots_out.vvp"')
        open('DB.txt', 'w').close()
        open('input.txt', 'w').close()
        open('slot_avail_DB.txt', 'w').close()

    elif(clear_all_slots=='N' or clear_all_slots=='n'):
        print(colored("Refresh",'blue'))
        os.system('cmd /c "python main2.py"')
        
    else:
        print(colored('Enter appropriate value!!','red'))
        clear_slot()


# clear_slot()

# open('DB.txt', 'w').close()
# open('input.txt', 'w').close()
# open('slot_avail_DB.txt', 'w').close()