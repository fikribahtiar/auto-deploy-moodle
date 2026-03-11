#!/bin/bash

APP_DIR=/opt/moodle

echo "Create directory"
mkdir -p $APP_DIR

cd $APP_DIR

if [ ! -d ".git" ]; then
    echo "Clone repo"
    git clone https://github.com/fikribahtiar/auto-deploy-moodle.git .
else
    echo "Pull latest code"
    git pull origin main
fi

echo "Run docker compose"

docker compose down
docker compose up -d