import os

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

open('DB.txt', 'w').close()
open('input.txt', 'w').close()