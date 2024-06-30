#!/bin/bash

kubectl apply -f ./k8s/deployment.yaml --kubeconfig ~/.kube/config 
kubectl apply -f ./k8s/service.yaml --kubeconfig ~/.kube/config 
kubectl apply -f ./k8s/nginx.yaml --kubeconfig ~/.kube/config 