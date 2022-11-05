import sys

secret_file = "my_env.txt"
my_env = open("/exercise/{}".format(secret_file))
if my_env:
    print("Secret file still exists")
    sys.exit()

print("{} file not found. Well done cleaning all your secrets.".format(secret_file))