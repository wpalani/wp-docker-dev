#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Configs
source ./configs.sh

cd "../"
source .env
PROJECT_DOMAIN=$PROJECT_DOMAIN

print_info "2/2 Creating SSL certificate..."

DIR="nginx/certs"
# If DIR doesn't exists, create it
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
fi

# If DIR is not empty, exit
if [ "$(ls -A $DIR)" ]; then
    print_error "'$DIR' directory is not empty."
    exit 1
fi

cd $DIR
mkcert $PROJECT_DOMAIN
