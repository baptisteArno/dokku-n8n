FROM node:14.15

ARG N8N_VERSION

RUN if [ -z "$N8N_VERSION" ] ; then echo "The N8N_VERSION argument is missing!" ; exit 1; fi

RUN \
	apt-get update && \
	apt-get -y install graphicsmagick gosu

# Set a custom user to not have n8n run as root
USER root

RUN npm_config_user=root npm install -g full-icu n8n@${N8N_VERSION} axios
ENV NODE_ICU_DATA /usr/local/lib/node_modules/full-icu
RUN npm link axios

COPY docker-entrypoint.sh /docker-entrypoint.sh
#COPY n8n-specifics.sh /n8n-specifics.sh
COPY reload-workflows.js /reload-workflows.js
#COPY post-deploy.sh /post-deploy.sh
COPY app.json /app.json
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 5678/tcp
