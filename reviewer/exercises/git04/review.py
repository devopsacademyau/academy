import sys

my_env = open("/exercise/my_env.txt")
if my_env:
    print("Secret file still exists")
    sys.exit()

print("Well done")