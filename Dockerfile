FROM node:10.16.0-jessie

RUN mkdir -p /src/app
WORKDIR /src/app

COPY . /src/app

RUN npm install

EXPOSE 3005

CMD [ "npm", "start"]