FROM ubuntu:22.04

RUN apt update -y && apt upgrade -y
RUN apt -y install curl 
RUN apt -y install gnupg

# install terraform, change focal to something else when upgrading
RUN curl -sL 'https://apt.releases.hashicorp.com/gpg' | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg 
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com jammy main" > /etc/apt/sources.list.d/hashicorp.list
RUN apt update -y 
RUN apt install terraform -y