#!/bin/bash

sudo apt update && sudo apt install docker.io -y

sudo docker pull ghcr.io/serwol2/app:latest && sudo docker run -p 4000:80 ghcr.io/serwol2/app