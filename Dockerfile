# create nginx image
FROM nginx:latest AS nginx

WORKDIR /etc/nginx
COPY nginx/*.conf ./conf.d


# create vue image
FROM node:14 AS vue

WORKDIR /app
ADD . /app/

RUN npm i -g npm
RUN yarn
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD [ "yarn", "start" ]
