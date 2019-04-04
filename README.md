# docker-strapi

[![Docker Pulls](https://img.shields.io/docker/pulls/gilhardl/strapi.svg?style=flat-square)](https://hub.docker.com/r/gilhardl/strapi/)

Docker image for Strapi development, based on [gilhardl/node](https://github.com/gilhardl/docker-node)

---

**Strapi :** 3.0.0-alpha.25.2

**Node.js :** v10.15.3

**NPM :** v6.4.1

**Yarn :** 1.13.0

**OS :** Linux alpine x64

**Package manager:** yarn

---

# Usage

## With docker

### Basic usage

```
docker run -it --name strapi-cli -v /path/to/your/project:/usr/src/api gilhardl/strapi
```

Note:

- `yourapp-db` is the name of your MongoDB container
- If you don't want to start the app, you don't necessary need specify a `-p 1337:1337` or `--link yourapp-db:mongo` parameters.

### Walkthrough

1. Create a volume for MongoDB data (if not exist)

```
docker volume create mongodb-data
```

1. Run MongoDB container for your database

```
docker run -it --name yourapp-db -p 27017:27017 -v mongodb-data:/data/db -e MONGO_INITDB_DATABASE=yourapp mongo
```

1. Run Strapi container to use Strapi CLI

```
docker run -it --name strapi-cli -v /path/to/your/project:/usr/src/api -p 1337:1337 --link yourapp-db:mongo gilhardl/strapi
```

1. Use Strapi CLI
   Create a project :

```
strapi new yourapp-api
? Choose your installation type Custom (manual settings)
? Choose your main database: MongoDB
? Database name: yourapp
? Host: yourapp-db
? +srv connection: false
? Port (It will be ignored if you enable +srv): 27017
? Username:
? Password:
? Authentication database (Maybe "admin" or blank):
? Enable SSL connection: false
```

Start API :

```
strapi start
```

## With docker-compose

`docker-compose.yml` example

```
version: '3'

services:
  api:
    container_name: yourapp-api
    build: .
    image: gilhardl/strapi
    ports:
      - 1337:1337
    volumes:
      - .:/usr/src/api/
    depends_on:
      - db
    command: strapi start
    restart: always

  db:
    container_name: yourapp-db
    image: mongo
    environment:
      - MONGO_INITDB_DATABASE=yourapp
    ports:
      - 27017:27017
    volumes:
      - mongodb-data:/data/db
    restart: always

volumes:
  mongodb-data:
```

# Licence

MIT
