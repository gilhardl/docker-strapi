# docker-strapi

Docker image for Strapi development, based on [gilhardl/node](https://github.com/gilhardl/docker-node)

[![Docker Pulls](https://img.shields.io/docker/pulls/gilhardl/strapi.svg?style=flat-square&label=PULLS)](https://hub.docker.com/r/gilhardl/strapi/)

---

![OS](https://img.shields.io/static/v1.svg?style=flat-square&label=OS&message=Linux%20Alpine)

![STRAPI](https://img.shields.io/npm/v/strapi/alpha.svg?style=flat-square&label=STRAPI&color=blue)

![NODE](https://img.shields.io/npm/v/node/lts.svg?style=flat-square&label=NODE)
![NPM](https://img.shields.io/npm/v/npm/lts.svg?style=flat-square&label=NPM)
![YARN](https://img.shields.io/npm/v/yarn/latest.svg?style=flat-square&label=YARN)

![PACKAGE MANAGER](https://img.shields.io/static/v1.svg?style=flat-square&label=PACKAGE%20MANAGER&message=Yarn)

---

# Usage

## With docker

### Basic usage
Start CLI :
```
docker run -it --name strapi -v /path/to/your/project:/usr/src/api gilhardl/strapi
```
Start CLI and expose port to be able to start the app :
```
docker run -it --name strapi -v /path/to/your/project:/usr/src/api gilhardl/strapi -p 1337:1337 --link yourapp-db:mongo
```

Note :

- `yourapp-db` is the name of your MongoDB container
- If you don't want to start the app, you don't need to specify `-p 1337:1337` or `--link yourapp-db:mongo` parameters.

### Walkthrough

1. Create a volume for MongoDB data (if not exist)
```
docker volume create mongodb-data
```

2. Run MongoDB container for your database
```
docker run -it --name yourapp-db -p 27017:27017 -v mongodb-data:/data/db -e MONGO_INITDB_DATABASE=yourapp mongo
```

3. Run Strapi container to use Strapi CLI
```
docker run -it --name strapi -v /path/to/your/project:/usr/src/api -p 1337:1337 --link yourapp-db:mongo gilhardl/strapi
```

4. Use Strapi CLI

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

...
```

Start API :
```
strapi start
```

## With docker-compose

Create a file named `docker-compose.yml` at your project root like the following :
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

Start database and API :
```
docker-compose up
```

# Licence

MIT
