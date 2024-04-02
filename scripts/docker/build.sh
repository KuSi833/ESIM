#!/bin/bash

echo 'Building Dockerfile with image name pymarl for Linux x86_64'
docker build --platform=linux/amd64 --no-cache --build-arg UID=1000 -t esim:latest .
