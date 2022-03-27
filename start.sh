value=$(cat name.txt)
source venv/bin/activate
export FLASK_APP=$value
export FLASK_ENV=development
fuser -k 5000/tcp
flask run
