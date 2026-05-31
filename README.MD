# Github Runner

- [Ejecutores autohospedados](https://docs.github.com/es/actions/concepts/runners/self-hosted-runners)

- [Agrega ejecutores auto-hospedados](https://docs.github.com/es/actions/how-tos/manage-runners/self-hosted-runners/add-runners)

- [github-runners Helm](https://artifacthub.io/packages/helm/custom-helm-charts/github-runners)


#### Download the latest runner package
```bash
curl -o actions-runner-linux-x64-2.334.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.334.0/actions-runner-linux-x64-2.334.0.tar.gz
```
#### Optional: Validate the hash
```bash
echo 
"048024cd2c848eb6f14d5646d56c13a4def2ae7ee3ad12122bee960c56f3d271  actions-runner-linux-x64-2.334.0.tar.gz" | shasum -a 256 -c
```
#### Extract the installer

```bash
tar xzf ./actions-runner-linux-x64-2.334.0.tar.gz ./runner
```

## Confgi & init 
```bash
./config.sh --url my-url-oganitation --token my-token

#Last step, run it!
./run.sh
```

## Ejcución con doker

```bash
docker build -t github-runner .

docker run -d -e URL_ORGANIZATION="your-url" -e RUNNER_TOKEN="your-token" github-runner
```


# ARC (kubernetes runner)

- [Pasos para la instalacion ](https://github.com/actions/actions-runner-controller/blob/master/docs/quickstart.md)
- [Documentacion ARC](https://docs.github.com/es/actions/concepts/runners/actions-runner-controller)

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
helm upgrade --install --namespace actions-runner-system --create-namespace\
  --set=authSecret.create=true\
  --set=authSecret.github_token="REPLACE_YOUR_TOKEN_HERE"\
  --wait actions-runner-controller actions-runner-controller/actions-runner-controller
l
```

#### Crear runner

    En la documetacion explica los pasos para levantar un runner con respecto a un repo, pero en este caso se va levantar un runner con respecto a la organizacion para tener el runner global 
 
 archivo para levantar con respecto a la organizacion [runnerdeployment.yaml](./ARC/runnerdeployment.yaml)


```bash
kubectl apply -f runnerdeployment.yaml
```

