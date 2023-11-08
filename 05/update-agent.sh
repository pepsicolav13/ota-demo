#!/bin/bash

docker compose up -d
digest=$(docker pull pepsicolav13/spring-boot 2>&1 | grep Digest)
while :
do
  img=$(docker pull pepsicolav13/spring-boot 2>&1 | grep Digest)
  echo "> Origin:   $digest"
  echo "> Candidte: $img"
  if [[ "$digest" != "$img" ]] then echo ">> Updating image!!" && docker compose down && docker compose up -d && digest=$img ; fi
  echo "-------------------------"
  sleep 5
done
