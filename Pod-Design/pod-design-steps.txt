#1
kubectl get pods --show-labels
#2
kubectl run nginx1 --image=nginx --labels=env=prod
kubectl run nginx2 --image=nginx --labels=env=prod
kubectl run nginx3 --image=nginx --labels=env=dev
kubectl run nginx4 --image=nginx --labels=env=dev
kubectl run nginx5 --image=nginx --labels=env=dev
#3
kubectl get pods --show-labels
#4
kubectl get pods -l env=dev
#5
kubectl get pods -l env=dev --show-labels
#6
kubectl get pods -l env=prod
#7
kubectl get pods -l env=prod --show-labels
#8
kubectl get pods -l env
#9
kubectl get pods -l env=dev,env=prod
#10
kubectl get pods -l env=dev,env=prod --show-labels
#11
kubectl label pod nginx1 env=uat --overwrite
kubectl get pods --show-labels
#12
kubectl label pod nginx1 nginx2 nginx3 nginx4 nginx5 env-
kubectl get pods --show-labels
#13
kubectl label pod nginx1 nginx2 nginx3 nginx4 nginx5 app=nginx --overwrite
kubectl get pods --show-labels
#14
kubectl get nodes --show-labels
#15
kubectl label node minikube nodeName=nginxnode
#16
kubectl apply -f ./Pod-Design/task16.yaml
#17
kubectl get pod nginx -o wide
kubectl get nodes --show-labels
kubectl label node minikube nodeName=nginxnode --overwrite
kubectl delete pod nginx
kubectl apply -f ./Pod-Design/task16.yaml
#18
kubectl get pod nginx --show-labels