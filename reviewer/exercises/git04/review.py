import sys

secret_file = "my_env.txt"
try:
    my_env = open("/exercise/{}".format(secret_file))
    print("fail")
    sys.exit()

except:
    print("done")