FROM node:alpine

WORKDIR /react

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=0 /docker-react/build  /usr/share/nginx/html