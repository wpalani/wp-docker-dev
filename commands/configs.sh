#!/bin/bash

# Colors
GREEN='\033[0;32m'
TEXT='\033[0m'
BLUE='\033[0;34m'
RED='\033[0;31m'
CYAN='\033[0;36m'

print_success() {
    echo -e "${GREEN}Success:${TEXT} $1"
}

print_error() {
    echo -e "${RED}Error:${TEXT} $1"
}

print_info() {
    echo -e "${BLUE}$1"
}
