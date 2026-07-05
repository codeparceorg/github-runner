# Imagen Docker personalizada

## Login en registry de github

[Documentacion oficial](https://docs.github.com/es/packages/working-with-a-github-packages-registry/working-with-the-container-registry)

```bash
# se debe crear un acces token con permisos de lectura y escritura de paquetes
export CR_PAT=YOUR_TOKEN

echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
```

## Construcción y Publicación de la imagen

```bash
docker build -t ghcr.io/codeparceorg/runner-arc:latest .
docker push ghcr.io/codeparceorg/runner-arc:latest
```
## Creacion del secret para descargar la imagen privada

```bash
kubectl create secret docker-registry ghcr-secret \
--docker-server=ghcr.io \
--docker-username=codeparce \
--docker-password=${{ secrets.CONTAINER_REGISTRY_PAT_GITHUB }} \
--namespace=actions-runner-system
```