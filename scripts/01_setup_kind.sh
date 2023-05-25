#!/bin/sh
#
# https://kind.sigs.k8s.io/docs/user/ingress/
#
set -x


cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF

# countour
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/control-plane","operator":"Equal","effect":"NoSchedule"},{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'

# ingress NGINX
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

# https://stackoverflow.com/questions/61616203/nginx-ingress-controller-failed-calling-webhook
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission

# Using ingress
kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/usage.yaml

# DONE - TESTING
# should output "foo-app"
curl localhost/foo/hostname
# should output "bar-app"
curl localhost/bar/hostname
