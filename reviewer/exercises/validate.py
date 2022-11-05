import json
import sys

exercises_changed = sys.argv[1].split(',')

output_multiple = open('error', 'w')
output_exercise = open('exercise', 'w')

output_multiple.write("{}".format("true" if len(exercises_changed) > 1 else "false"))
output_exercise.write("{}".format(exercises_changed[0]))
