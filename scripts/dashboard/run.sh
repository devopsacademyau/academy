cd /app
mkdir ~/.config/gspread/
echo $GOOGLE_KEY |base64 -d > ~/.config/gspread/service_account.json
./dashboard.sh
python3 dashboard.py