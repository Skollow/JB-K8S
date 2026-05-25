#1
kubectl create deploy webapp --image=nginx --dry-run=client -o yaml > ./Deployment-Design/webapp.yaml
kubectl apply -f ./Deployment-Design/webapp.yaml #after editing replica
#2
kubectl rollout status deployment webapp
#3
kubectl get rs
#4
kubectl get rs -o yaml > ./Deployment-Design/rs.yaml
kubectl get pods -o yaml > ./Deployment-Design/pods.yaml
#5
kubectl delete deployment webapp
kubectl get pods -w
#6
kubectl create deploy webapp --image=nginx:1.17.1 --dry-run=client -o yaml > ./Deployment-Design/webapp.yaml
kubectl apply -f ./Deployment-Design/webapp.yaml
kubectl describe deployment webapp
#7
kubectl set image deployment/webapp nginx=nginx:1.17.4
kubectl describe deployment webapp
#8
kubectl rollout history deployment webapp
#9
kubectl rollout undo deployment webapp
kubectl describe deployment webapp
#10
kubectl set image deployment/webapp nginx=nginx:1.100
kubectl get pods #there
kubectl rollout undo deployment webapp
kubectl get pods #no longer there
kubectl rollout history deploy webapp --revision=7
kubectl rollout history deployment webapp
kubectl set image deployment/webapp nginx=nginx:latest
kubectl rollout history deployment webapp
kubectl get pods
#11
kubectl autoscale deployment webapp --min=10 --max=20 --cpu-percent=85
kubectl get hpa
kubectl get deployment webapp
#13
kubectl delete deployment webapp
kubectl delete hpa webapp
#14
kubectl create job hello-job --image=busybox --dry-run=client -o yaml -- echo "Hello I am from job" > ./Deployment-Design/hello-job.yaml #edit in filr completions: 10