import os

open('DB.txt', 'w').close()
open('input.txt', 'w').close()

# flat_number=input("Enter Your Flat Number : ")
# password=input("Enter Your Password : ")

# file = open("input.txt", "r")
# print(flat_number,password)

os.system('cmd /c "iverilog -o main_out.vvp main.v"')
os.system('cmd /c "vvp main_out.vvp"')
