FROM node:18.14.1

#RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
# Set working directory
WORKDIR /usr/src/app
#WORKDIR /home/node/app
COPY package*.json ./

# Ensure the correct ownership and permissions
RUN chown -R node:node /usr/src/app

USER node

RUN npm install

COPY --chown=node:node . .
#ENV HOST=0.0.0.0

EXPOSE 1234

CMD [ "node", "./bin/server.cjs" ]