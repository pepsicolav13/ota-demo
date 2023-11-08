# Deploy to Cloud

```bash
kubectl get pod
```

```bash
kubectl run mynginx --image nginx --restart Never
```


```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: mynginx
  name: mypod
spec:
  containers:
  - name: mynginx
    image: nginx
```

```bash
kubectl create -f pod.yaml
```


```yaml
apiVersion: v1
kind: Service
metadata:
  name: mynginx
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    run: mynginx
```


```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mynginx-deploy
  labels:
    app: nginx
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 25%
      maxSurge: 25%
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
```


```bash
kubectl get deploy
```


```bash
minikube start

minikube addons enable metrics-server
minikube addons enable dashboard

minikube dashboard
```


```bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/prometheus

helm repo add grafana https://grafana.github.io/helm-charts
helm install grafana grafana/grafana
minikube service grafana --url

# configure prometheus endpoint
# import dashboard: 6417
# import dashboard: 13770
```


### Rolling Update

1. Change spring boot application
2. Tag different version
3. Create a Deployment
4. curl the endpoint
5. Update a Deployment

