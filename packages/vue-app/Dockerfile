FROM node:14.16.1-alpine as build

WORKDIR /app

COPY package.json ./

COPY ../packages/vue-app ./packages/vue-app
COPY ../packages/shared ./packages/shared
COPY yarn.lock ./

RUN yarn workspace @webstore/vue-app install
RUN yarn workspace @webstore/utils install

WORKDIR /app/packages/vue-app

RUN yarn build

#Stage 2
#######################################
FROM nginx:1.19.0

COPY ../packages/vue-app/nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*
COPY --from=build /app/packages/vue-app/dist .

ENTRYPOINT ["nginx", "-g", "daemon off;"]
