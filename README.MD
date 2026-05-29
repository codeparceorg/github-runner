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
docker run -d -e URL_ORGANIZATION="your-url" -e RUNNER_TOKEN="your-token" github-runner
```
