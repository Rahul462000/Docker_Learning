# a specific base image to start the project 
          # LAYER 1
FROM node:18-alpine  


# This is the working directory 
#any subsequesnt instruction in docker file will start from here
           #LAYER 2
WORKDIR /app

            #LAYER 3
# installing dependencies first so they can be cached
# means we don't want to install our dependencies again and again
# copy the local package.json file  to place we want it to be copies in the container i.e current working directory (./)

COPY package*.json ./


             #LAYER 4
#installing the dependencies with a specific command
#SHELL FORM
RUN npm install 

# results will be commited to docker image as layer 
# now we have our modules in our image then we will copy our source code 

# copy source code to current working directory of docker container
             #LAYER 5
COPY . .

#to run the source code we need a enviroment variable
            #LAYER 6
ENV PORT=8080

#when we have a running container at port 8080 then
# we also have to LISTEN the container on same port
            #LAYER 7
EXPOSE 8080

# it will tell the container to how to actually run the applicaiton
# by start the process and serve the express app
#EXECUTABLE FORM
          #LAYER 8
CMD [ "npm","start" ]




