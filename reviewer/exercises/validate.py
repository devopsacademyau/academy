import json
import sys

# files_changed = []
# for args in sys.argv[1:]:
#     files_changed.append(args.split(','))
files_changed = sys.argv[1].split(',')
# files_changed = [num for elem in files_changed for num in elem]
exercises_changed = []
MULTIPLE="false"
output_multiple = open('error', 'w')
output_exercise = open('exercise', 'w')

for f in files_changed:
    exercise = f.split('/')[2]
    if not exercise in exercises_changed:
        exercises_changed.append(exercise)

if len(exercises_changed) > 1:
    MULTIPLE="true"

output_multiple.write("{}".format(MULTIPLE))
output_exercise.write("{}".format(exercises_changed[0]))
