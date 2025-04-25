alias k="kubectl"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kc="kubectl create"
alias ke="kubectl edit"
alias ka="kubectl apply -f"
alias kl="kubectl logs"
alias kex="kubectl exec -it"

alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgd="kubectl get deployments"
alias kgn="kubectl get nodes"
alias kgi="kubectl get ingress"
alias kga="kubectl get all --all-namespaces"

alias kgi='kubectl get ingress'
alias kgia='kubectl get ingress --all-namespaces'
alias kei='kubectl edit ingress'
alias kdi='kubectl describe ingress'
alias kdeli='kubectl delete ingress'


alias kx="kubectx"       
alias kns="kubens" 

alias kpf="kubectl port-forward"
alias krun="kubectl run --rm -it --image"
alias ktop="kubectl top" 

## 手动设置配置文件多个环境设置多个配置文件命令
alias zyk8s="export KUBECONFIG=/Users/boo/Documents/k8s/kube-config.yaml"
## 手动指定命名空间
alias yapin="kubectl config set-context --current --namespace=yapi"
