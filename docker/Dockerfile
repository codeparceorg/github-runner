FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 1. Instalamos las dependencias necesarias para Docker
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# 2. Instalamos el CLI de Docker (Docker Engine)
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash devops && \
    echo "devops:devops" | chpasswd && \
    usermod -aG sudo devops

RUN echo "devops ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /github

COPY entry.sh  ./

RUN chmod +x entry.sh && chown devops:devops -R /github

USER devops

COPY runner  ./

CMD ["./entry.sh"]

#CMD ["tail", "-f", "/dev/null"]

## pasar el token y la url de la organizacion por variables de entorno
# -e URL_ORGANIZATION="https://github.com/my-org" \
# -e RUNNER_TOKEN="my-runner-token"
# -v /var/run/docker.sock:/var/run/docker.sock
