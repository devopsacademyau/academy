import json
import sys

files_changed = sys.argv[1].split(',')
exercises_changed = []
ERROR="false"
output_error = open('error', 'w')
output_exercise = open('exercise', 'w')

for f in files_changed:
    exercise = f.split('/')[2]
    if not exercise in exercises_changed:
        exercises_changed.append(exercise)

if len(exercises_changed) > 1:
    ERROR="true"

output_error.write("{}".format(ERROR))
output_exercise.write("{}".format(exercises_changed[0]))
