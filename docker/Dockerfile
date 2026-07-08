FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Dependencias
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Instalar Docker CLI (no Docker Engine)
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli docker-compose-plugin && \
    rm -rf /var/lib/apt/lists/*

# Usuario
RUN useradd -m -s /bin/bash devops && \
    echo "devops:devops" | chpasswd && \
    usermod -aG sudo devops && \
    echo "devops ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /github

COPY entry.sh ./
RUN chmod +x entry.sh

COPY runner ./
RUN chown -R devops:devops /github

USER devops

CMD ["./entry.sh"]