FROM node:14.16.1-alpine

WORKDIR /app

COPY package.json ./

COPY ../packages/vue-app ./packages/vue-app
COPY ../packages/shared ./packages/shared
COPY yarn.lock ./

RUN yarn workspace @webstore/vue-app install
RUN yarn workspace @webstore/utils install

EXPOSE 8080

WORKDIR /app/packages/vue-app

CMD ["yarn", "start"]
