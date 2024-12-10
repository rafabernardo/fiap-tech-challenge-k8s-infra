kubectl create configmap env-config --from-env-file=.env
kubectl apply -f ./infrastructure/kubernetes/metrics.yaml
kubectl apply -f ./infrastructure/kubernetes/hpa.yaml
kubectl apply -f ./infrastructure/kubernetes/deployment.yaml
kubectl apply -f ./infrastructure/kubernetes/service.yaml