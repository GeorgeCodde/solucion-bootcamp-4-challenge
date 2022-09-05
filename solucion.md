## Práctica 1

Dado este proyecto en NodeJS, crea su Dockerfile sabiendo que nos han pedido como imagen base ubuntu:18.04, versión 16 de NodeJS, el 8888 será el puerto donde exponga la comunicación la applicación, la señal de STOP debe llegarle a la aplicación y el contenedor podría ser iniciado con cualquier proceso.

- Contruccion del dokerfile

```docker
FROM ubuntu:18.04

WORKDIR /usr/src/app

COPY ./ /usr/src/app/

RUN apt update \
    && apt upgrade \
    && apt install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | bash \
    && apt install nodejs -y \
    && node -v \
    && npm install

EXPOSE 8888

CMD ["sh", "-c", "date ; npm start "]
```

- Ejecución del contenedor en local

```
docker run -ti --rm -p 8888:8888 backend-node

```

## Práctica 2
Sube la imagen de Docker a DockerHub.

```
docker login
docker tag backend-node jorgels120878/app-node:V1.0
docker push jorgels120878/app-node:V1.0
```

## Práctica 3
Automatiza el proceso de creación de la imagen de Docker y su subida a Docker Hub después de cada cambio en el repositorio utitlizando Github Actions.

## Práctica 4
Se debe crear una aplicación en Heroku y desplegarla allí usando github actions.
