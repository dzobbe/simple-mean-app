#!/bin/sh
sleep 1
cd /usr/src/app/server 
npm start &
sleep 2
cd /usr/src/app/client
npm start
