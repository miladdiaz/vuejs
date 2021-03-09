FROM node:14

# Create app directory
WORKDIR /app
ADD . /app/

# global install & update
RUN npm i -g npm
#RUN npm i -g yarn

#RUN rm yarn.lock
RUN yarn
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

# start command
CMD [ "yarn", "start" ]