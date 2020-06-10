import gspread
import csv
import os
import math
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from datetime import date
from matplotlib.font_manager import FontProperties

print("*** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***")
print("Updating Dashboard Worksheet")
sheet_key = os.environ['SHEET_KEY']
wks_name = "Dashboard"

gc = gspread.service_account()
sheet = gc.open_by_key(sheet_key)
wks = sheet.worksheet(wks_name)

with open('result.csv', newline='') as csvfile:
    data = list(csv.reader(csvfile))
    del data[0]
wks.update('B3', data)
print("Dashboard Worksheet update completed")
print("*** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***\n\n")

print("*** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***")
print("Updating ProgressionData Worksheet")
current_day = date.today().strftime("%d-%b")
print("Date being inserted in the worksheet:", current_day)

wks_name = "Dashboard"

gc = gspread.service_account()
wks = sheet.worksheet(wks_name)
c01_comp = float(wks.get('R3').first()[:-1])
c02_comp = float(wks.get('R9').first()[:-1])
c03_comp = float(wks.get('R20').first()[:-1])
c04_comp = float(wks.get('R30').first()[:-1])
c05_comp = float(wks.get('R38').first()[:-1])
c06_comp = float(wks.get('R43').first()[:-1])
c07_comp = 0

wks_name = "ProgressionData"
wks = sheet.worksheet(wks_name)

cell_row = 2
cell_col = "A"
while cell_row < 100:

  cell = cell_col + str(cell_row)

  try:
    wks.get(cell).first()
  except Exception as e:
    print("Cell", cell, "is null")
    cell_set = cell + ":H" + str(cell_row)
    print("Cells to be updated:", cell_set)
    wks.update(cell_set, [[current_day, c01_comp, c02_comp, c03_comp, c04_comp, c05_comp, c06_comp, c07_comp]])
    break
  val = wks.get(cell).first()
  if val == current_day:
    print("Updating row", cell_row , "with latest information")
    cell_set = cell + ":H" + str(cell_row)
    print("Cells to be updated:", cell_set)
    wks.update(cell_set, [[current_day, c01_comp, c02_comp, c03_comp, c04_comp, c05_comp, c06_comp, c07_comp]])
    break
  print("Date", val, "exists in the worksheet")
  cell_row += 1


print("ProgressionData Worksheet update completed")
print("*** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***\n\n")

print("*** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***")
print("Creating Chart")

df = pd.DataFrame(wks.get_all_records())


# Plot Style
plt.style.use('ggplot')
plt.figure(figsize=(12,5))
plt.xticks(rotation=30)

# create a color palette
palette = plt.get_cmap('Dark2')

# multiple line plot
num = 0
for column in df.drop('Dates', axis=1):
  num += 1
  plt.plot(df['Dates'], df[column], marker = '', color=palette(num), linewidth=1, alpha=0.9, label=column)

# Add legend
fontP = FontProperties()
fontP.set_size('small')
plt.legend(bbox_to_anchor=(1.01,0.5), loc="center left", prop=fontP)


# Add titles
plt.title("Exercises Completion Progress", loc='center', fontsize=14, fontweight=0, color='orange')
plt.xlabel("Dates")
plt.ylabel("% Completed")

# Set Y range
plt.axis([0, 10, -1, 100])

# Save chart
plt.savefig('chart.png', bbox_inches='tight')

print("Chart creation completed")
print("*** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***\n\n")
