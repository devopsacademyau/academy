mkdir ~/.config/gspread/
echo $GOOGLE_KEY |base64 -d > ~/.config/gspread/service_account.json
python3 app/dashboard.py