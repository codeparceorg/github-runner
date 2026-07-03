# Github Runner

- [Ejecutores autohospedados](https://docs.github.com/es/actions/concepts/runners/self-hosted-runners)

- [Agrega ejecutores auto-hospedados](https://docs.github.com/es/actions/how-tos/manage-runners/self-hosted-runners/add-runners)

- [github-runners Helm](https://artifacthub.io/packages/helm/custom-helm-charts/github-runners)


#### Download the latest runner package
```bash
curl -o actions-runner-linux-x64-2.334.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.334.0/actions-runner-linux-x64-2.334.0.tar.gz
```
#### Extract the installer

```bash
mkdir -p ./runner
tar xzf ./actions-runner-linux-x64-2.334.0.tar.gz -C ./runner
```

## Confgi & init 
```bash
./config.sh --url my-url-oganitation --token my-token

#Last step, run it!
./run.sh
```

## Ejcución con doker


```bash
## los mismos pasos anteriores pero en la carpeta docker
## 1. Download the latest runner package
## 2. Extract the installer

cd docker

docker build -t github-runner .

docker run -d -e URL_ORGANIZATION="your-url" -e RUNNER_TOKEN="your-token" github-runner
```


# ARC (kubernetes runner)

- [Pasos para la instalacion ](https://github.com/actions/actions-runner-controller/blob/master/docs/quickstart.md)
- [Documentacion ARC](https://docs.github.com/es/actions/concepts/runners/actions-runner-controller)
- [Automatically scaling runners](https://github.com/actions/actions-runner-controller/blob/master/docs/automatically-scaling-runners.md?utm_source=chatgpt.com)
 

## Primeros pasos 

#### instalar certficados github

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.2/cert-manager.yaml

## Se debe crear un PAT (perosnal acces token) para los passos posteriores con roles de admin de la org
```

#### Deployar y configurar ARC (Helm)

```bash
# se aagrega el repo 
helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller

## Install helm chart
helm upgrade --install --namespace actions-runner-system --create-namespace \
  --set=authSecret.create=true \
  --set=authSecret.github_token="YOUR_PESONAL_ACCES_TOKEN" \
  --wait actions-runner-controller actions-runner-controller/actions-runner-controller
```

#### Crear runner

 archivo para levantar runners en el cluster [runnerdeployment.yaml](./ARC/runnerdeployment.yaml) y el auto escalado [hras.yml](./ARC/hras.yml)


```bash
kubectl apply -f runnerdeployment.yaml
## para el auto escalado
kubectl apply -f hras.yaml
```

