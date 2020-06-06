import gspread
import csv
import os
import math
from datetime import date

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

