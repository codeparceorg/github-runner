# Usa la imagen oficial como base
FROM summerwind/actions-runner-dind:latest

# Cambia a root para instalar herramientas
USER root

# Instala herramientas necesarias (ejemplo: kubectl y helm)
RUN apt-get update && apt-get install -y gettext \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Vuelve al usuario que usa el runner (por seguridad)
USER runner