export FLASK_APP=$projectName
export FLASK_ENV=development
fuser -k 5000/tcp
flask run
