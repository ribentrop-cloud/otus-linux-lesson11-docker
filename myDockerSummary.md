
### Моя шпора по докеру

- Run this in the same place as  Dockerfile to create image:
```sh
docker build --tag bulletinboard:1.0 .
```

- Run image as a container:
```sh
docker run [--publish 8000:80 --detach --name ngotus] ngotus:1.0
```

- List images:
```sh
docker image ls
```

- List containers:
```sh
docker ps
docker ps -a
```

- Delete container:
```sh
docker rm [container]
```

- Delete image:
```sh
docker rmi [image]
```

- Show docker logs:
```sh
docker logs [OPTIONS] CONTAINER
docker logs cbc639df70db
```

- Run shell in container:
```sh
docker exec -it [f68b0f0403d]  /bin/sh
```

- Docker stop container:
```sh
docker container kill [f68b0f0403d]
```

- Tag an image :
```sh
docker tag local-image:tagname new-repo:tagname
```

- Login to docke hub repository : 
```sh
docker login -u "LOGIN" -p "PASS" docker.io
```

-  Push to dockerfile:
```sh
docker push ribentrop/ngotus:tagname
```
