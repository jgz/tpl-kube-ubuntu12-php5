#!/bin/sh

. ../release.config

docker build -t $REPO/$PROJECT_NAME:$RELEASE_VERSION ../
