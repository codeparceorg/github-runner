FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash devops && \
    echo "devops:devops" | chpasswd && \
    usermod -aG sudo devops

RUN echo "devops ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER devops

WORKDIR /github

COPY runner  ./

COPY entry.sh  ./

CMD ["./entry.sh"]

#CMD ["tail", "-f", "/dev/null"]

## pasar el token y la url de la organizacion por variables de entorno
# -e URL_ORGANIZATION="https://github.com/my-org" \
# -e RUNNER_TOKEN="my-runner-token"