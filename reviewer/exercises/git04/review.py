import sys

def github_error(message):
    print("::error title=Exercise submission failed::{}".format(message))

def github_summary(message):
    print("SUMMARY: {}".format(message))


secret_file = "my_env.txt"

try:
    my_env = open("/exercise/{}".format(secret_file))

except:
    github_summary("### Exercise completed :rocket:")
    github_summary("Secret file {} not found. Well done cleaning all your secrets.".format(secret_file))
    sys.exit()

github_error("Secret file {} still exists. Please update your code and submit again.".format(secret_file))
raise Exception("Submission failed.")