FROM node:14.16.1-alpine

WORKDIR /app

COPY package.json ./

COPY ../packages/nextjs-blog ./packages/nextjs-blog
COPY ../packages/shared ./packages/shared
COPY yarn.lock ./

RUN yarn workspace @webstore/next-blog install
RUN yarn workspace @webstore/utils install

EXPOSE 80

WORKDIR /app/packages/nextjs-blog

RUN yarn build

CMD yarn start
