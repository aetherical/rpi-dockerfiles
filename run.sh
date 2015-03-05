#!/bin/bash

DIR=`basename $0`
START_DIR=`pwd`


usage() {
    echo Usage:
    echo $0 project
}

if [[ $# -lt 1 ]]; then
    usage
    exit 1
fi

PROJECT=$1
PROJECT_DIR=$DIR/$PROJECT
BUILD=$PROJECT_DIR/build
$CONFIG=$PROJECT_DIR/config

if [[ ! -e $CONFIG ]]; then
    echo "${PROJECT} config does not exist"
    exit 1
fi


source $CONFIG

if [[ -n "$DEPENDS" ]]; then
    echo Checking to see if the $DEPENDS is in docker cache

    # local image
    echo "  local"
    LOCAL=`docker images|grep $DEPENDS`
    if [[ -z "$LOCAL" ]]; then
	# main repository
	echo "  main"
	MAIN=`docker search ${DEPENDS}|grep ${DEPENDS}`
	if [[ -z "$MAIN" ]]; then
	    echo Building Dependency: ${DEPENDS}
	    $0 $DEPENDS
	    if [[ $? -ne 0 ]]; then
		echo Aborting
		exit 2
	    fi
	fi
    fi
fi

echo "Pulling git repository"
git pull $REPO_URL $BUILD

echo "Copying Dockerfile"
cp ${PROJECT_DIR}/Dockerfile $BUILD

cd $BUILD
echo "Building Container"
docker build -t $PROJECT .

if [[ $? -ne 0 ]]; then
    echo "An Error Occurred, Aborting"
    cd $START_DIR
    exit 1
fi

cd $START_DIR
