#!/bin/bash

echo "Enter flaskapp name:"
read projectName

# Initialize virtual environment
python3 -m venv venv

# Add requirements.txt
touch requirements.txt

# Add gitignore
touch .gitignore

# Initialize project
mkdir $projectName

# Initialize all directories
mkdir $projectName/api/
mkdir $projectName/static/
mkdir $projectName/templates/


touch $projectName/__init__.py
touch $projectName/config.ini
touch $projectName/api/index.py
touch $projectName/api/home.py
touch $projectName/static/styles.css
touch $projectName/templates/index.html
touch $projectName/templates/home.html

# Contents of files
cat > $projectName/static/styles.css << EOF
h1{
    color: orange;
    background-color: blue;
}
EOF

cat > $projectName/templates/index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>
    <link rel="stylesheet" href="{{url_for('static', filename='styles.css')}}">
</head>
<body>
    <h1>Index Page</h1>
</body>
</html>
EOF

cat > $projectName/templates/home.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>
    <link rel="stylesheet" href="{{url_for('static', filename='styles.css')}}">
</head>
<body>
    <h1>Home Page</h1>
</body>
</html>
EOF


cat > $projectName/templates/home.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>
    <link rel="stylesheet" href="{{url_for('static', filename='styles.css')}}">
</head>
<body>
    <h1>Home Page</h1>
</body>
</html>
h1{
    color: orange;
    background-color: blue;
}
EOF

cat > $projectName/__init__.py << EOF
from flask import Flask

from .api.home import home
from .api.index import index

app = Flask(__name__)

# Routes
app.register_blueprint(home,url_prefix='/home')
app.register_blueprint(index,url_prefix='/')


if(__name__=="__main__"):
    app.run(debug=True)
EOF


cat > $projectName/api/index.py << EOF
from flask import Blueprint, render_template

index = Blueprint('index',__name__)

@index.route('/')
def routePoint():
    return render_template('index.html')
EOF

cat > $projectName/api/home.py << EOF
from flask import Blueprint, render_template

home = Blueprint('home',__name__)

@home.route('/')
def routePoint():
    return render_template('home.html')
EOF

export FLASK_APP=$projectName
export FLASK_ENV=development
