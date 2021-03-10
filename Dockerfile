# create nginx image
FROM nginx:latest as nginx1

WORKDIR /etc/nginx
COPY nginx/*.conf ./conf.d


# create vue image
FROM node:14 as vue1

WORKDIR /app
ADD . /app/

RUN npm i -g npm
RUN yarn
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD [ "yarn", "start" ]
