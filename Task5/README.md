# Execution
```sh
minukube start --network-plugin=cni --cni=calico --driver=docker
kubectl get pods -n kube-system -l k8s-app=calico-node

kubectl run front-end-app --image=nginx --labels role=front-end --expose --port 80
kubectl run back-end-api-app --image=nginx --labels role=back-end-api --expose --port 80
kubectl run admin-front-end-app --image=nginx --labels role=admin-front-end --expose --port 80
kubectl run admin-back-end-api-app --image=nginx --labels role=admin-back-end-api --expose --port 80

kubectl get pods --show-labels
kubectl apply -f k8s/
```

# Result

> Запуск пода **без label**

```sh
-> kubectl run test-pod --image=alpine --restart=Never -it -- sh -c "wget -qO- --timeout=2 http://back-end-api-app"
```

> Возврат ответа

```sh
If you don't see a command prompt, try pressing enter.
wget: download timed out
pod default/test-pod terminated (Error)
```

> clean (да, я помню про --rm)

```sh
-> kubectl delete pod test-pod
pod "test-pod" deleted
```

>  Запуск пода **с label**

```sh
-> kubectl run test-pod --image=alpine --restart=Never --labels role=front-end -it -- sh -c "wget -qO- --timeout=2 http://back-end-api-app"
```

> Возврат ответа 

```html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```
