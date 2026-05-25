#1 - im in powershell, not linux
@"
key1=value1
key2=value2
"@ | Out-File ./Config/config.txt
Get-Content ./Config/config.txt
#2
kubectl create configmap keyvalcfgmap --from-file=./Config/config.txt
kubectl get configmap keyvalcfgmap -o yaml
#3
kubectl run nginx --image=nginx --restart=Never --dry-run=client -o yaml > Config/nginx-pod.yml
#edit
envFrom:
- configMapRef:
    name: keyvalcfgmap
kubectl apply -f Config/nginx-pod.yml
kubectl exec -it nginx -- env