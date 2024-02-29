FROM terraform-ubu:local.latest

# install azure cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# install aztfexport
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg 
RUN echo "deb [signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" > /etc/apt/sources.list.d/microsoft.list
RUN apt update -y 
RUN apt install aztfexport