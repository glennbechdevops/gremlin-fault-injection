# Use an official base image
FROM ubuntu:20.04

# Install dependencies required for Gremlin installation
RUN sudo apt update && sudo apt install -y apt-transport-https dirmngr

# Add the Gremlin repo
RUN echo "deb https://deb.gremlin.com/ release non-free" | sudo tee /etc/apt/sources.list.d/gremlin.list

# Install the Gremlin client and daemon
RUN apt update && sudo apt install -y gremlin gremlind

# Copy your application files (adjust the source path as necessary)
COPY . /app
WORKDIR /app
EXPOSE 80