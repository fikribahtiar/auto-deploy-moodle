#!/bin/bash

SERVER_DIR=/opt/moodle

if ! command -v docker &> /dev/null
then
    echo "Install Docker..."
    curl -fsSL https://get.docker.com | sh
fi

if ! command -v docker compose &> /dev/null
then
    apt install docker-compose-plugin -y
fi

mkdir -p $SERVER_DIR
cd $SERVER_DIR

if [ ! -d "moodle" ]; then
    git clone -b MOODLE_500_STABLE https://github.com/moodle/moodle.git
fi

cd moodle

docker compose down
docker compose up -d