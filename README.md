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

## Install modules
```
  yarn install or npm install
```

## Run project local
```
  docker-compose up --build -d
```

## Create local cluster
```
  ./create-local-cluster-k3d.sh
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
  - http://localhost:8080/ -> next-blog
  - http://localhost:8080/react -> react-app
  - http://localhost:8080/vue -> vue-app

## View Applications service mesh
  - https://localhost:2001/ -> Kiali

## Author
- Harrisson Ricardo Biaggio
