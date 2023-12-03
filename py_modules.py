import os
from termcolor import colored

def vehicle_entry():

    flat_number = input(colored("Enter Your Flat Number : ",'magenta'))
    password = input(colored("Enter Your Password : ",'magenta'))

    def DecimalToBinary(n):
        return bin(n).replace("0b", "")

    flat_number_binary = DecimalToBinary(int(flat_number))
    pwd_binary = DecimalToBinary(int(password))

    print(flat_number, password)

    file = open("input.txt", "w")
    file.write(flat_number_binary + " " + pwd_binary)
    file.close()

    os.system('cmd /c "iverilog -o pass_check_out.vvp pass_check.v"')
    os.system('cmd /c "vvp pass_check_out.vvp"')

def vehicle_exit():
    # print("vehicle exited")
    flat_number = input(colored("Enter Your Flat Number : ",'magenta'))

    def DecimalToBinary(n):
        return bin(n).replace("0b", "")

    flat_number_binary = DecimalToBinary(int(flat_number))

    print(flat_number_binary)

    file = open("input.txt", "w")
    file.write(flat_number_binary)
    file.close()

    os.system('cmd /c "iverilog -o reserved_exit_out.vvp reserved_parking_exit.v"')
    os.system('cmd /c "vvp reserved_exit_out.vvp"')

def guest_parking(n):
    # print("this is guest parking")
    if(n==2):
        os.system('cmd /c "iverilog -o guest_entry_out.vvp guest_parking_entry.v"')
        os.system('cmd /c "vvp guest_entry_out.vvp"')
    else:
        os.system('cmd /c "iverilog -o guest_exit_out.vvp guest_parking_exit.v"')
        os.system('cmd /c "vvp guest_exit_out.vvp"')

def clear_slot():
    clear_all_slots = input(colored("Do you want to End this session ? (Y/N) : ",'red'))

    if(clear_all_slots=='Y' or clear_all_slots=='y'):
        print(colored("Session Ended",'green'))
        os.system('cmd /c "iverilog -o clear_slots_out.vvp clear_slots.v"')
        os.system('cmd /c "vvp clear_slots_out.vvp"')
        open('DB.txt', 'w').close()
        open('input.txt', 'w').close()
        open('DB_reserved.txt', 'w').close()
        open('number_of_slots.v', 'w').close()
        open('output.txt', 'w').close()

    elif(clear_all_slots=='N' or clear_all_slots=='n'):
        print(colored("Refresh",'blue'))
        os.system('cmd /c "python py_main2.py"')
        
    else:
        print(colored('Enter appropriate value!!','red'))
        clear_slot()


# clear_slot()

# open('DB.txt', 'w').close()
# open('input.txt', 'w').close()
# open('DB_reserved.txt', 'w').close()