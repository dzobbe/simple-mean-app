# Create image based off of the official Node 10 image
FROM node:10.7.0-alpine

# Create a directory where our app will be placed
RUN mkdir -p /usr/src/app/client

# Change directory so that our commands run inside this new dir
WORKDIR /usr/src/app/client

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# Copy dependency definitions
COPY AngularClient/package.json /usr/src/app/client

# Install dependecies
RUN npm install

RUN npm install rxjs@6.0.0 --save


RUN npm install node-sass

# Get all the code needed to run the app
COPY ./AngularClient /usr/src/app/client

#####SERVER

# Create a directory where our app will be placed
RUN mkdir -p /usr/src/app/server

# Change directory so that our commands run inside this new dir
WORKDIR /usr/src/app/server

# Copy dependency definitions
COPY Server/package.json /usr/src/app/server

# Install dependecies
RUN npm install

# Get all the code needed to run the app
COPY ./Server /usr/src/app/server


#ENV HOSTNAME=“localhost”
#RUN echo "foo" > /etc/hostname

#### Expose the port the app runs in
EXPOSE 4200
EXPOSE 3000

WORKDIR /

COPY ./start.sh /
RUN chmod +x ./start.sh
CMD ./start.sh
