#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Configs
source ./configs.sh

cd "../"
source .env

# Check if we already have a wp-config.php file
docker-compose run --rm wp config path > /dev/null 2>&1

# If we don't have a wp-config.php file, create one
if [[ $? -ne 0 ]]; then
    DB_NAME=$DB_NAME
    DB_USER=$DB_USER
    DB_PASSWORD=$DB_PASSWORD
    DB_HOST=$DB_HOST

    docker-compose run --rm wp config create \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD \
        --dbhost=$DB_HOST \
        --skip-check \
        > /dev/null 2>&1

    # Check if wp-config.php was created successfully
    if [[ $? -eq 0 ]]; then
        echo ""
        print_success "wp-config.php created."
    else
        print_error "failed to create wp-config.php. Please check your setup."
        exit 1
    fi
else
    echo ""
fi

# Provide site url
URL=$PROJECT_DOMAIN
echo -e "${TEXT}Visit ${CYAN}https://$URL${TEXT} to see your site."
