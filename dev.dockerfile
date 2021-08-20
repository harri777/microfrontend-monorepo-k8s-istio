FROM node:14.5.0-alpine

WORKDIR /app
COPY package.json .
COPY yarn.lock .

ENV PATH /app/packages/vue-app/node_modules/.bin:$PATH

RUN npm install
RUN npm install -g lerna

COPY . .

EXPOSE 4000 3000 8080

CMD ["lerna", "run", "dev", "--scope=@webstore/next-blog", "--scope=@webstore/react-app", "--scope=@webstore/vue-app"]
