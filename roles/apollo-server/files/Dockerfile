FROM        node

MAINTAINER  Zaid Albirawi

COPY        Dockerfile /node/home/apollo-server/Dockerfile
COPY        src/* /node/home/apollo-server/src/
WORKDIR     /node/home/apollo-server/src

RUN         npm i

ENTRYPOINT  node index.js
