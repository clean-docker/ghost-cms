#!/usr/bin/env bash

if [ "$1" == "start" ]; then
    sudo docker-compose start
fi

if [ "$1" == "stop" ]; then
    sudo docker-compose stop
fi

if [ "$1" == "update" ]; then    
    sudo docker-compose pull && docker-compose up -d
fi

if [ "$1" == "setup" ]; then
  echo 'Setting system...' \
  && read -p "[1/2] Enter your domain (ex : mydomain.com or localhost) : " DOMAIN
  read -p "[2/2] Which port do you want to access the web server on? (ex : 80) " WEB_PORT \
  && rm -rf ghost; git clone https://github.com/woosungchoi/ghost-cms ghost \
  && cd ghost \
  && mv docker-compose.yml docker-compose.ssl.yml \
  && mv docker-compose.local.yml docker-compose.yml \
  && sed -i "s/<port>/$WEB_PORT/g" docker-compose.yml \
  && sed -i "s/<domain>/$DOMAIN/g" docker-compose.yml \
  && echo 'Installing Docker...' \
  && sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
  && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y \
  && sudo apt update -y \
  && sudo apt install docker-ce docker-ce-cli containerd.io -y \
  && if [ ! -f /usr/local/bin/docker-compose ] ; then
        echo 'Installing Docker Compose...' \
        && COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4) \
        && sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
        && sudo chmod +x /usr/local/bin/docker-compose
        else echo 'Skip Installing Docker Compose'
     fi
  sudo chmod +x dc \
  && echo 'Starting Docker and db...' \
  && sudo docker-compose up -d db \
  && echo 'Waiting 10 secs for Mariadb to build databases...' \
  && sleep 10 \
  && sudo docker-compose up -d ghost --no-deps \
  && echo 'Done! 🎉' \
  && echo 'by Rafael Correa Gomes and Woosung Choi' \
  && echo 'Access your ghost: http://'$DOMAIN':'$WEB_PORT \
  && echo 'Access your ghost admin panel: http://'$DOMAIN':'$WEB_PORT'/ghost';
fi
