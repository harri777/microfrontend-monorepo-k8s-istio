FROM node:14.16.1-alpine as build

WORKDIR /app

COPY package.json ./

COPY ../packages/react-app ./packages/react-app

COPY yarn.lock ./


RUN yarn workspace @webstore/react-app install

WORKDIR /app/packages/react-app

RUN yarn build

#Stage 2
#######################################
FROM nginx:1.19.0

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*
COPY --from=build /app/packages/react-app/build .

ENTRYPOINT ["nginx", "-g", "daemon off;"]
