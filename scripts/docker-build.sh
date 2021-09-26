#!/bin/sh

. ../release.config

docker build -t $REPO_PREFIX/$PROJECT_NAME:$RELEASE_VERSION ../
