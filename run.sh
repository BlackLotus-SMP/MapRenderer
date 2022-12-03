#!/bin/bash

docker build -t ovw .
./stop.sh
docker run -d --name ovwcnt -v "$PWD"/resources:/home/user/render ovw
