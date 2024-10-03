#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Configs
source ./configs.sh

print_info "1/2 Downloading WordPress..."

DIR="../wordpress/"
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
fi

if [ "$(ls -A $DIR)" ]; then
    print_error "wordpress directory is not empty"
    exit 1
else
    cd "../wordpress/"
    curl -O https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    rm latest.tar.gz
    mv wordpress/* .
    rmdir wordpress

    print_success "Downloaded WordPress!"
fi
