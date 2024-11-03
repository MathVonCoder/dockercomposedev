FROM debian:11-slim

RUN apt update -y && apt upgrade -y
RUN apt install curl -y

# install docker cli (for debian, see : https://docs.docker.com/engine/install/debian/)
RUN apt install -y ca-certificates curl gnupg
# RUN mkdir -p /etc/apt/keyrings
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg |  gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r /etc/apt/keyrings/docker.gpg

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  
RUN apt update -y
RUN apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# kubectl, ref: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

# dl latest
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"  

# install
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


# helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh


# checkcontainerd.io_<version>_<arch>.deb
# docker run -it dock8s bash
# > helm version
# > kubectl version --client
# > docker info