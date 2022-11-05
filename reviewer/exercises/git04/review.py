import sys

secret_file = "my_env.txt"
my_env = open("/exercise/{}".format(secret_file))
if my_env:
    print("fail")
    sys.exit()