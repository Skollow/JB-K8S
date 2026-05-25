#1
kubectl run nginx-pod-nadav --image=nginx:alpine
#2
kubectl run messaging --image=redis:alpine --labels="tier=msg"
#3
kubectl create namespace apx-x998-nadav
#4
kubectl get nodes -o json > C:\tmp\nodes-nadav.json
#5
kubectl expose pod messaging --name=messaging-service --port=6379 --target-port=6379 --type=ClusterIP
kubectl get svc #varification of services
kubectl get endpoints messaging-service #verification of endpoints
#6
kubectl create service clusterip messaging-service --tcp=6379:6379 #wont work as svc messaging-service already exists
#7
kubectl create deployment hr-web-app --image=kodekloud/webapp-color --replicas=2
kubectl get deployments #verification of deployments
kubectl get pods #verification of pods
#8 - using minikube
minikube ssh
ls /etc/kubernetes/manifests
sudo tee /etc/kubernetes/manifests/static-busybox.yaml > /dev/null <<EOF #used this command as manually editing the yaml file caused some issues
    apiVersion: v1
    kind: Pod
    metadata:
        name: static-busybox
    spec:
        containers:
        - name: busybox
        image: busybox
        command: ["sleep", "1000"]
    EOF
kubectl get pods #verification on new pod
#9
kubectl create namespace finance-nadav
kubectl run temp-bus --image=redis:alpine --namespace=finance-nadav
kubectl get pods -n finance-nadav #verification of pods
#10-12 in dedicated files
#13
kubectl create deployment nginx-deploy --image=nginx:1.16 --replicas=1
kubectl annotate deployment nginx-deploy kubernetes.io/change-cause="nginx:1.16 deploy"
kubectl set image deployment/nginx-deploy nginx=nginx:1.17
kubectl annotate deployment nginx-deploy kubernetes.io/change-cause="upgraded"
kubectl rollout status deployment/nginx-deploy #verification
#14
kubectl run nginx-resolver --image=nginx
kubectl expose pod nginx-resolver --name=nginx-resolver-service --port=80
kubectl run dns --image=busybox:1.28 -- nslookup 
kubectl run dns --image=busybox:1.28 -- nslookup nginx-resolver > First-Part/nginx-nadav.pod
#15
minikube ssh #did here instead of node01 beacuse im using minikube
sudo vi /etc/kubernetes/manifests/nginx-critical.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-critical
spec:
  containers:
  - name: nginx
    image: nginx
#16
kubectl apply -f First-Part/task16/multi-pod.yaml