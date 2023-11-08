# Container


```bash
docker run whalesay cowsay 'hello world!'
# Unable to find image 'docker/whalesay:latest' locally
# ....
#  ______________
# < hello world! >
#  --------------
#     \
#      \
#       \
#                     ##        .
#               ## ## ##       ==
#            ## ## ## ##      ===
#        /""""""""""""""""___/ ===
#   ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#        \______ o          __/
#         \    \        __/
#           \____\______/
# 
```


```python
import os

name = os.environ.get("NAME", "world!")
print("hello " + name)
```


```Dockerfile
FROM nginx

RUN apt update && apt install -y python3 dnsutils iproute2
ENV NAME=bob
ADD hello.py .

CMD ["python3", "hello.py"]
```


```bash
docker build . -t myfirstimg
```

```bash
docker images
```

```bash
docker run myfirstimg
```

```bash
docker run nginx
```


```bash
# background
docker run -d nginx
```

```bash
docker ps

# CONTAINER ID     IMAGE      COMMAND         CREATED         ...
# cbf17c6cf502     ubuntu     "sh -c .."      2 minutes ago   ...
```

*`CONTAINER_ID`는 사용자마다 다릅니다.*


```bash
docker logs -f cbf17c6cf502
```

```bash
docker stop cbf17c6cf502
```

```bash
docker ps
docker ps -a
```

```bash
docker rm cbf17c6cf502
```

```bash
docker run -d nginx
```

```bash
docker ps

docker exec $COND apt update
docker exec $COND apt install -y curl
docker exec $COND curl localhost
```


```bash
docker cp Dockerfile $COND:/tmp/.
```

```bash
docker exec -it $COND bash

# inside container
$ root@1c23d59f4289:/#

$ root@1c23d59f4289:/# cat /etc/os-release

$ root@1c23d59f4289:/# exit
```

```bash
docker ps
# CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
# d80e34dea778        nginx               "/docker-entrypoint.…"   5 minutes ago       Up 5 minutes        80/tcp              charming_lumiere

docker inspect d80e34dea778
```



```bash
docker run -e john myfirstimg
```

```bash
docker run -p 8080:80 nginx
```

```bash
docker run -v $(PWD):/tmp nginx
```


```bash
docker tag myfirstimg $USERNAME/myfirstimg
```

```bash
docker login
```

```bash
docker push $USERNAME/myfirstimg
```

```bash
docker pull $USERNAME/myfirstimg
```

```bash
docker rmi myfirstimg
```

```bash
docker commit
```


## Real world Examples

```bash
docker run --rm -e MYSQL_ROOT_PASSWORD=1234 -e MYSQL_USER=myuser -e MYSQL_PASSWORD=1234 -p 3306:3306 -d mysql
```

```bash
docker run --rm -e WORDPRESS_DB_HOST=$(hostname -i) -e WORDPRESS_DB_USER=myuser -e WORDPRESS_DB_PASSWORD=1234 -e WORDPRESS_DB_NAME=mydb -p 8080:80 -d wordpress
```

```bash
docker run --rm -p 8080:8080 jenkins/jenkins
```

```bash
docker run -it ubuntu:20.04 bash
docker run -it ubuntu:22.04 bash
docker run -it centos:7 bash
```


