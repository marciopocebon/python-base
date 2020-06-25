#!/bin/bash
echo -e "\e[1;33mpushDockerImages.sh\e[0m"

echo "Push gvit/python-base..."
docker push gvit/python-base:latest

echo "Push gvit/python-base..."
docker push gvit/python-secbase:latest

echo -e "\e[32m$0 Done!\e[0m"
