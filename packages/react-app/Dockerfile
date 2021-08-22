FROM node:14.16.1-alpine as build

WORKDIR /app

COPY package.json ./

COPY ../packages/react-app ./packages/react-app

COPY yarn.lock ./


RUN yarn workspace @webstore/react-app install

WORKDIR /app/packages/react-app

RUN yarn build

EXPOSE 80

#Stage 2
#######################################
FROM nginx:1.19.0

WORKDIR /usr/share/nginx/html

COPY ../packages/react-app/nginx.conf /etc/nginx/nginx.conf

RUN rm -rf ./*
COPY --from=build /app/packages/react-app/build .

ENTRYPOINT ["nginx", "-g", "daemon off;"]
