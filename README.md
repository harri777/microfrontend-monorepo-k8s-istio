<h1 align="center">Monorepo at microfrontends deploy with k8s and istio</h1>

## Disclaimer

The objective of this project is to show an orchestration architecture of a microfrontends monorepo for development and production environments, in addition to testing the sharing of libraries and utilities

- 3 packages were createds (NextJS, ReactJS e VueJS)
- A package for sharing libraries/function/utilities has been created (shared) - NextJs and VueJs share it.

- Development environment were used: Docker, Lerna e Nginx - You might want to [see more details here](https://github.com/hawkz94/microfrontend-monorepo-k8s-istio/blob/master/diagrams/local.jpeg).

- Production environment were used: Kubernetes, Yarn workspaces e Istio - You might want to [see more details here](https://github.com/hawkz94/microfrontend-monorepo-k8s-istio/blob/master/diagrams/production.jpeg).


## Dependencies
- [Lerna](https://lerna.js.org/)
- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker compose](https://docs.docker.com/compose/install/)
- [Kubctl](https://kubernetes.io/docs/tasks/tools/)
- To deploy locally use: [k3d](https://k3d.io/)
- To deploy cloud use: [AWS-EKS-Terraform](https://github.com/hawkz94/eks-terraform-k8s)

## 1. Install dependencies
```
  yarn or npm install
```

## 1.2 Run project local without k8s
```
  docker-compose -f docker-compose-dev.yml up -d --build
```

## 2. Create local cluster k8s
```
  k3d cluster create mycluster --servers 1 --agents 2 --port 9080:80@loadbalancer --port 9443:443@loadbalancer --api-port 6443 --k3s-server-arg '--no-deploy=traefik'
```

## 2.1 Install and apply Istio
```
  ./istio-install-k3d.sh
```

## 2.3 Deployment applications
```
  - Deployments:
    - k8s/istio-gateway-deployment.yml
    - packages/nextjs-blog/k8s/deployment.yml
    - packages/react-app/k8s/deployment.yml
    - packages/vue-app/k8s/deployment.yml
```

```
  apply all deployments: ./apply-all-deployments.sh
```



## Get nodes
```
  - kubctl get nodes
  - kubctl get pods
```

## View Applications
  - http://localhost:9080/ -> next-blog
  - http://localhost:9080/react -> react-app
  - http://localhost:9080/vue -> vue-app

## Install Applications service mesh
```
  ./istio-install-tools.sh
```
```
  - https://localhost:20001/ -> Kiali
  - https://localhost:9090/ -> Prometheus
  - https://localhost:3000/ -> Grafana
```

## Destroy local environment
```
  k3d cluster delete mycluster
```

## Author
- Harrisson Ricardo Biaggio
