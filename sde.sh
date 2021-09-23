#!/bin/bash

case $1 in
    setup)
    # Create local directory if not exist
    abs_path=$(pwd)
    dir_name="${abs_path}/local/"
    if [ -d ""${dir_name}"" ]
    then
        echo "*** Local directory found, checking relevent Repos"
    else
        echo "*** Creating a local directory..."
        mkdir local
        echo "*** Created..."
        echo "*** Checking relevant repos..."
    fi

    cd local/

    # Clone WM API if not exist
    abs_path=$(pwd)
    dir_name="${abs_path}/whale-money-api/"
    if [ -d ""${dir_name}"" ]
    then
        echo "*** WM-Api found..."
    else
        echo "*** Pulling Web app..."
        git clone https://github.com/isbobby/learn-better-web.git
    fi

    # Clone WM Tele if not exist
    abs_path=$(pwd)
    dir_name="${abs_path}/whale-money-tele/"
    if [ -d ""${dir_name}"" ]
    then
        echo "*** WM-tele found..."
    else
        echo "*** Pulling API..."
        git clone https://github.com/isbobby/learn-better-core.git
        # Set up virtual environment and download dependencies
    fi

    cd learn-better-core/
    python3 -m venv venv
    source venv/bin/activate
    pip3 install -r requirements.txt
    cd ..
    deactivate

    echo "*** Set up complete"
    ;;
    run-core)
    cd local/learn-better-core
    source venv/bin/activate
    python3 app.py
    ;;
    run-web)
    cd local/learn-better-web/web
    npm start
    ;;
    *)
    echo "Choose script functions - "
    echo "./wmc.sh setup - create local directory and clone relevant repos"
    ;;
esac
