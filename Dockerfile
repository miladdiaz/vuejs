FROM node:14

# Create app directory
WORKDIR /app
ADD . /app/

# global install & update
RUN npm i -g npm

#RUN rm yarn.lock
RUN yarn
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

# start command
CMD [ "yarn", "start" ]


FROM nginx:latest
WORKDIR /etc/nginx
COPY nginx/nuxt.diaz.ir.conf ./conf.d