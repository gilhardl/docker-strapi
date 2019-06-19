FROM gilhardl/node

LABEL author="Lucas GILHARD <l.gilhard@gmail.com>"
LABEL description="Docker image for Strapi development"

WORKDIR /usr/src/api/

USER root

RUN apk add --no-cache build-base gcc autoconf automake libtool zlib-dev libpng-dev nasm

# STRAPI
RUN npm install -g strapi@beta

# EXPOSE PORTS
EXPOSE 1337

CMD ["bash"]