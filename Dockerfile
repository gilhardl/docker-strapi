FROM gilhardl/node

LABEL author="Lucas GILHARD <l.gilhard@gmail.com>"
LABEL description="Docker image for Strapi development"

WORKDIR /usr/src/api/

USER root

RUN apt-get install -y build-base gcc autoconf automake libtool zlib-dev libpng-dev nasm
RUN apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* /var/cache/apt/*

# STRAPI
RUN npm install -g strapi@beta

# EXPOSE PORTS
EXPOSE 1337

CMD ["bash"]