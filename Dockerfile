FROM node:16.13

WORKDIR /usr/local/app

ENV NODE_ENV production

# Just copy the package.json...
COPY package.json package-lock.json /usr/local/app/

# so we can cache this layer:
RUN npm install && npm cache clean --force

COPY ./ ./

EXPOSE 8080

# command to run on container start
CMD [ "node", "./bin/www" ]