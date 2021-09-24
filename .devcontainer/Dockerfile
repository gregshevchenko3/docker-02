FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y nginx

ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then /bin/sh -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi
# "postStartCommand": "/docker-entrypoint.sh"
# for creating composer projects
RUN apt-get install -y php git composer

# for laravel mix.js
RUN apt-get install -y nodejs

# database and caches for laravel's project
RUN apt-get install -y mariadb-server #redis

# path to site nginx_config
ARG NGINX_CONFIG=""
RUN export NGINX_CONFIG

# Run and set up all services
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# Create sql-database and user 
COPY ./database.sql /tmp/
COPY ./create_database.sh /tmp/
RUN chmod a+x /tmp/create_database.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "sleep", "infinity" ]
