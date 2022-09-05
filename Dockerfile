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