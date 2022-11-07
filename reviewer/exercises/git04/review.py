import sys

secret_file = "my_env.txt"
fail = False
try:
    my_env = open("/exercise/{}".format(secret_file))

except:
    print("Secret file {} not found. Well done cleaning all your secrets.".format(secret_file))
    sys.exit()

::error title='Wrong answer'::'Secret file {} still exists. Please update your code and submit again.'".format(secret_file)
raise Exception("Submission failed.")