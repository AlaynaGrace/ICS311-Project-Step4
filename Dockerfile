# get base alpine image
FROM node:latest

# create working dir and add everything into it
WORKDIR /
ADD . /

# expose port for access to website
EXPOSE 3003

# copy over npm packages and env vars
COPY package*.json /
RUN npm install
# start up server
CMD ["npm","start"]
