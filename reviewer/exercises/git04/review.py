import sys

secret_file = "my_env.txt"

github_error(title, message):
    print("::error title={}::{}".format(title, message))

try:
    my_env = open("/exercise/{}".format(secret_file))

except:
    print("SUMMARY: ### Exercise completed :rocket:")
    print("SUMMARY: Exercise completed. Secret file {} not found. Well done cleaning all your secrets.".format(secret_file))
    sys.exit()

github_error("Wrong answer", "Secret file {} still exists. Please update your code and submit again.".format(secret_file))
raise Exception("Submission failed.")