ARG NODE_VERSION=10.15
FROM gilhardl/node:$NODE_VERSION

ARG STRAPI_VERSION=3.0.0-alpha.25.1

LABEL author="Lucas GILHARD <l.gilhard@gmail.com>"
LABEL version="3.0.0-alpha.25.1"
LABEL description="Docker image for Strapi development"

WORKDIR /usr/src/api/

USER root

# Strapi
RUN yarn global add strapi@$STRAPI_VERSION

EXPOSE 1337

CMD ["bash"]