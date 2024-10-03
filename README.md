# Docker Compose WordPress Local Environment.
A straight forward WordPress local development environment with [Docker Compose](https://docs.docker.com/compose/).

#### Notes
- This project uses the [Make utility](https://www.gnu.org/software/make/) to simplify the setup process.
- Currently, only unix-based systems (Linux, MacOS) with arm64 chips like Apple silicon are supported. I intend to add Windows and Intel chips support in the near future.

## Features
- Pre-configured Nginx, PHP, MYSQL, WordPress and WP-CLI.
- Domain and local SSL.
- Persistent Database.

## Requirments
- [Docker](https://www.docker.com/) must be installed and running on the system.
- [MKCert](https://github.com/FiloSottile/mkcert) must be installed.
```
brew install mkcert
brew install nss # if you use Firefox
```
Then:
```
mkcert -install
```
- Local environment url must be added to the hosts file `/etc/hosts`. (See step 2 in the usage section)

## Usage
1. Clone this repo.

2. Rename `.env.example` file to `.env` and change the `COMPOSE_PROJECT_NAME` and `PROJECT_DOMAIN` values to your desired entries.
`COMPOSE_PROJECT_NAME`: the network/container names prefix in docker.
`PROJECT_DOMAIN`: the WordPress site url.

Whatever value you enter in the `PROJECT_DOMAIN` it MUST end with `.test` and be added to the hosts file `/etc/hosts` so the domain is accessible in the browser:
```
127.0.0.1       yourdomain.test
```

3. From the project repo run `make init`.
This will handle the initial docker configurations for the project, install WordPress and generate local SSL files.

4. Run `make up` to spin up docker.

5. Visit the project domain in your browser to access the site/WordPress.


## Available commands
| Command                              | Description                                                      |
|--------------------------------------|------------------------------------------------------------------|
| make init                            | Initialize the project and import WordPress                      |
| make up                              | Start the site (docker container)                                |
| make down                            | Stop the site (docker container)                                 |
| make clean                           | Remove docker network (containers, volumes, images, and orphans) |
| docker-compose run --rm wp [command] | Run a WP CLI command                                             |


### WP-CLI
WP-CLI is installed by default in the environment. From your project root, you can run WP-CLI commands like so:
```
docker-compose run --rm wp [command]

// example
docker-compose run --rm wp user list
```


#### Credit
This project is heavily inspired by [Andrew Schmelyun's](https://github.com/aschmelyun) WordPress Docker Compose repo: [aschmelyun/docker-compose-wordpress](https://github.com/aschmelyun/docker-compose-wordpress).

While the original project is fantastic, it doesn't support arm64-based chips (Apple M1, M2, M3) and hasn't been updated in a while.

#### Improvements from Andrew's Repo:
- Arm64 Support: Apple M1, M2, and M3 chips.
- Updated Tooling: Utilizes PHP 8.2 and MySQL 8.
- Environment Variables: Enhanced configurability.
- SSL: Automatically installed and configured.
- WordPress: Automatically installed and configured.
- Improved Docker Naming: Better container and network naming conventions.
- Persistent Storage: Enabled by default for data persistence.
