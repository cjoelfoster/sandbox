#! /usr/bin/env python3.6

import sys
import subprocess
import time

print(sys.version_info)
time.sleep(2.0)

# Initialize Sandbox
subprocess.call("clear")
name = input("Type your name and press 'Enter': ")

def Initialize_sandbox(name):
	subprocess.call("clear")
	print("Hello " + name + ", Welcome to the Sandbox!")
	print("Press ':q:' to exit")
	print("Press the 'Space' key and 'Enter' to clear the screen")



# Begin Sandbox
Initialize_sandbox(name)

n = ""
while(n !=':q:'):
	n = input(":: ")
	if(n==':q:'):
		print("Goodbye!")
	elif(n==' '):
		Initialize_sandbox(name)
	else:
		print("   " + n)


#exit
subprocess.call("clear")
