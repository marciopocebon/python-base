#!/bin/bash
directoryx="$(dirname -- $(readlink -fn -- "$0"; echo x))"
scriptPath="${directoryx%x}"

echo -e "\e[1;33m$0\e[0m"

if [ -z $1 ]
then
    echo "Using cached build mode."
    cachOp1=''
else
    echo "Using no-cache build mode."
    cachOp1='--no-cache'
fi

dockerInfo=`docker info 2>&1`

if [[ $dockerInfo == *"Is the docker daemon running"* ]]; then
    echo -e "\e[31mFATAL: Can't reach docker. Check to be sure docker info returns.\e[0m"
    exit 1 
fi

# Build Images
djangoDockerFile="Dockerfile.pybase"
echo "Build gvit/python-base..."
docker build . -f ${djangoDockerFile} ${cacheMode} -t gvit/python-base:latest

djangoDockerFile="Dockerfile.secbase"
echo "Build gvit/python-secbase..."
docker build . -f ${djangoDockerFile} ${cacheMode} -t gvit/python-secbase:latest

echo -e "\e[32m$0 Done!\e[0m"
