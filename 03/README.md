# Deploy to Car

```bash
docker pull pepsicolav13/nginx

docker images --digests
```


```yaml
services:
  db:
    # We use a mariadb image which supports both amd64 & arm64 architecture
    image: mariadb:10.6.4-focal
    # If you really want to use MySQL, uncomment the following line
    #image: mysql:8.0.27
    command: '--default-authentication-plugin=mysql_native_password'
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=somewordpress
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - MYSQL_PASSWORD=wordpress
    expose:
      - 3306
      - 33060
  wordpress:
    image: wordpress:latest
    ports:
      - 80:80
    restart: always
    environment:
      - WORDPRESS_DB_HOST=db
      - WORDPRESS_DB_USER=wordpress
      - WORDPRESS_DB_PASSWORD=wordpress
      - WORDPRESS_DB_NAME=wordpress
volumes:
  db_data:
```

```bash
docker compose -f docker-compose.yml.wordpress up
```


```yaml
version: '3.4'
services:
  web:
    image: pepsicolav13/spring-boot
    restart: always
    ports:
    - 8080:8080
    healthcheck:
      test: curl --fail http://localhost:8080 || exit 1
      interval: 60s
      retries: 5
      start_period: 20s
      timeout: 10s
```

```bash
docker compose -f docker-compose.yml.healthcheck up

docker ps

docker exec -it $CON bash
kill 1
```
