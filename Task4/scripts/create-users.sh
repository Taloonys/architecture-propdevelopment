#!/bin/bash
for user in developer qa; do
   # generate private key
  openssl genrsa -out $user.key 2048 

  # create certificate signing request
  openssl req -new -key $user.key -out $user.csr -subj "/CN=$user/O=group-$user"

  # sign certificate
  openssl x509 -req -in $user.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out $user.crt -days 365

  # add users to kubeconfig
  kubectl config set-credentials $user --client-certificate=$user.crt --client-key=$user.key

  # add context, for prettier cluster switching
  kubectl config set-context $user-context --cluster=minikube --user=$user
done
