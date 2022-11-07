import sys

secret_file = "my_env.txt"
try:
    my_env = open("/exercise/{}".format(secret_file))
    print("::error title='Wrong answer'::'Secret file still exists. Please update your code and submit again.'")
    sys.exit()

except:
    print("done")