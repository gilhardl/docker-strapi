# docker-strapi

[![Docker Pulls](https://img.shields.io/docker/pulls/gilhardl/strapi.svg?style=flat-square)](https://hub.docker.com/r/gilhardl/strapi/)

Docker image for Strapi development

----------------------------------------

**Strapi :** 3.0.0-alpha.25

**Node.js :** v10.15.3

**NPM :** v6.4.1

**Yarn :** 1.13.0

**OS :** Linux alpine x64

**Package manager:** yarn

----------------------------------------


# Usage

```
docker run -it --name STRAPI -v /path/to/your/project:/usr/src/api -p 1337:1337 gilhardl/strapi
```

### Serving your app

```
strapi start
```

# Licence

MIT