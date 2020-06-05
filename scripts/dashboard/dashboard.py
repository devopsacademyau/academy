import gspread
import csv
import os

sheek_key = os.environ['SHEET_KEY']
wks_name = os.environ['WKS_NAME']

gc = gspread.service_account()

sheet = gc.open_by_key(sheek_key)
worksheet_list = sheet.worksheets()

wks = sheet.worksheet(wks_name)

with open('result.csv', newline='') as csvfile:
    data = list(csv.reader(csvfile))
    del data[0]
wks.update('B3', data)

print(data)