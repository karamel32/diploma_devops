#!/bin/bash

if [ -z "$1" ]; then
echo "SET VERSION IMAGE !!!!!!"
exit 1
fi

deploy_file=../k8s/fe-deployment-nhl_app.yaml

source ~/.bashrc
cd ~/diploma_devops/frontend
#kubectl delete -f nhl_app_fe.yaml
docker build -t karamel32/nhl_app:$1 .
docker push karamel32/nhl_app:$1
sed -i "s/nhl_app:[0-9]\+\.[0-9]\+\.[0-9]\+/nhl_app:$1/g" $deploy_file
kubectl apply -f $deploy_file
kubectl get po -w
