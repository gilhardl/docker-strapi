ARG NODE_VERSION=10.15
FROM node:$NODE_VERSION-alpine

LABEL author="Lucas GILHARD <l.gilhard@gmail.com>"
LABEL version="1.0.0"
LABEL description="Docker image for Strapi development"

ARG APP_DIR="/app"

# Linux setup
RUN apk update \
  && rm -rf /tmp/* /var/cache/apk/* ~/.npm \
  && npm cache verify \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

# Yarn
RUN apk add yarn

# Strapi
RUN yarn global add strapi@3.0.0-alpha.24.1

EXPOSE 1337

WORKDIR $APP_DIR