FROM gilhardl/node

LABEL author="Lucas GILHARD <l.gilhard@gmail.com>"
LABEL description="Docker image for Strapi development"

WORKDIR /usr/src/api/

USER root

# STRAPI
RUN npm install -g strapi@next

# EXPOSE PORTS
EXPOSE 1337

CMD ["bash"]