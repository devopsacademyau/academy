import argparse
import os
import shutil
import sys
from pathlib import Path

EXERCISES_FOLDER=Path("/app/")
STUDENT_EXERCISES_FOLDER=Path("/students/{}".format(os.environ['GH_USER']))

def exercise(exercise):
    if not exercise:
        exercise = input("What exercise would you like to generate files for: ")
    
    exercise_folder = Path(EXERCISES_FOLDER, "{}".format(exercise))
    student_exercise_folder = Path(STUDENT_EXERCISES_FOLDER, "exercises/{}".format(exercise))

    # print(exercise_folder)
    # print(student_exercise_folder)
    if not exercise_folder.exists():
        sys.exit("Exercise not found.")

    if student_exercise_folder.exists():
        print("Exercise folder already exists.")
        refresh = input("Do you want to refresh all the exercise files anyway? (y/Y): ")
        if refresh.lower() != 'y':
            print("Aborted.")
            sys.exit()
    
    if not student_exercise_folder.exists():
        print("Creating folder {}".format(student_exercise_folder))
        Path.mkdir(student_exercise_folder, parents=True)

    print("Copying all files from exercise {}".format(exercise))
    shutil.copytree(exercise_folder, student_exercise_folder, dirs_exist_ok=True)

    # run exercise after script setup
    custom_config(exercise)

def custom_config(exercise):
    if exercise == "git04":
        with open(Path(STUDENT_EXERCISES_FOLDER, "exercises/{}/my_env.txt".format(exercise)), 'w') as f:
            f.write("SERVICE_NAME=account-management\nENVIRONMENT=prod\nPASSWORD=pass1234")
        os.system("git add {}".format(Path(STUDENT_EXERCISES_FOLDER, "exercises/{}/my_env.txt".format(exercise))))
        os.system("git commit -am 'commit my secret'")

def setup():
    # override folder path when running python script outside docker
    if os.getenv('LOCAL_RUN', False):
        global EXERCISES_FOLDER
        global STUDENT_EXERCISES_FOLDER
        EXERCISES_FOLDER=Path(Path().resolve(), "exercises")
        STUDENT_EXERCISES_FOLDER=Path(Path().resolve(), "students/{}".format(os.environ['GH_USER']))
      
def main():
    setup()
    parser = argparse.ArgumentParser()
    # parser.add_argument(dest='option', help="What option to run")
    parser.add_argument('-e', dest='exercise', help="What exercise name to run", required=False)
    args = parser.parse_args()

    # if args.option == "exercise":
    exercise(args.exercise)

 
if __name__ == "__main__":
    main()