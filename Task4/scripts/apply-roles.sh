minikube start --driver=docker
kubectl apply -f ../k8s/
kubectl get roles,rolebindings --all-namespaces
