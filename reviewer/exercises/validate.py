import json
import sys

files_changed = sys.argv[1].split(',')
exercises_changed = []

for f in files_changed:
    exercise = f.split('/')[2]
    if not exercise in exercises_changed:
        exercises_changed.append(exercise)

if len(exercises_changed) > 1:
    print("multiple exercises changed, please amend your PR")
    sys.exit()

print(exercises_changed[0])