FROM node

WORKDIR /code

COPY . ./

RUN npm i express cluster

ENV NODE_ENV production

CMD node main.js
