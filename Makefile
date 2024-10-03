GWP = ./commands/gwp.sh
MKCERT = ./commands/mkcert.sh
STARTWP = ./commands/startwp.sh

# Initialize the project and import WordPress
init:
	@echo "Initializing the project..."
	@chmod +x $(GWP)
	@$(GWP)
	@echo ""
	@chmod +x $(MKCERT)
	@$(MKCERT)
	@echo ""
	@echo "\033[32mProject initialized successfully!\033[0m"
	@echo ""
	@echo "Run \033[36m'make up'\033[0m to start the site."

# Start the site
up:
	@echo "Starting the site..."
	@docker-compose up -d --build site;
	@chmod +x $(STARTWP)
	@$(STARTWP)

# Stop the site
down:
	@echo "Stopping the site..."
	@docker-compose down

# Clean up the project docker network (remove volumes, images, and orphans)
clean:
	@echo "Cleaning up..."
	@docker-compose down --volumes --rmi all --remove-orphans

# Show help
help:
	@echo "Usage:"
	@echo "  make <command>"
	@echo ""
	@echo "Available commands:"
	@echo "  init    Initialize the project and import WordPress"
	@echo "  up      Start the site"
	@echo "  down    Stop the site"
	@echo "  clean   Remove the project docker network"
.DEFAULT_GOAL := help

.PHONY: init up down clean help
