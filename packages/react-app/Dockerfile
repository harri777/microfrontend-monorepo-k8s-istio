FROM node:14.16.1-alpine

WORKDIR /app

COPY package.json ./

COPY ../packages/react-app ./packages/react-app

COPY yarn.lock ./


RUN yarn workspace @webstore/react install

EXPOSE 4000

WORKDIR /app/packages/react-app

CMD ["yarn", "start"]
