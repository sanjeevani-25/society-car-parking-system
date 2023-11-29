# import subprocess
# proc = subprocess.Popen('cmd.exe', stdin=subprocess.PIPE)
# print("run")
# proc.stdin.write(b"python --version")
# proc.stdin.flush()

import os

# flat_number=input("Enter Your Flat Number : ")
# password=input("Enter Your Password : ")

# print(flat_number,password)

# os.system('cmd /c "iverilog --v"')
os.system('cmd /c "iverilog -o main_out.vvp main.v"')
os.system('cmd /c "vvp main_out.vvp"')
