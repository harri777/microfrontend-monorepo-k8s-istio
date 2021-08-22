<h1 align="center">[WIP] Monorepo at microfrontends deploy with k8s and istio</h1>

## Disclaimer
```

```


## Dependencies
- [Lerna](https://lerna.js.org/)
- [NodeJS](https://nodejs.org/en/)
- [Kubctl](https://kubernetes.io/docs/tasks/tools/)
- To deploy locally use: [k3d](https://k3d.io/)
- To deploy cloud use: [AWS-EKS-Terraform](https://github.com/hawkz94/eks-terraform-k8s)

## Install dependencies
```
  yarn or npm install
```

## Run project local
```
  docker-compose -f docker-compose-dev.yml up -d --build
```

## Create local cluster
```
  k3d cluster create mycluster --servers 1 --agents 2 --port 9080:80@loadbalancer --port 9443:443@loadbalancer --api-port 6443 --k3s-server-arg '--no-deploy=traefik'
```

## Install and apply Istio
```
  ./install-istio.sh
```

## Deployment applications
```
  ./all-deployments.sh
```

## Get nodes
```
  kubctl get nodes
```

## View Applications
  - http://localhost:9080/ -> next-blog
  - http://localhost:9080/react -> react-app
  - http://localhost:9080/vue -> vue-app

## View Applications service mesh
  - https://localhost:2001/ -> Kiali

## Destroy local environment
```
  k3d cluster create mycluster
```

## Author
- Harrisson Ricardo Biaggio
