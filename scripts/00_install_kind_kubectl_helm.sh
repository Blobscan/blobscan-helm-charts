#!/bin/sh
#
# https://kind.sigs.k8s.io/docs/user/quick-start/
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
#

if [ ! -f /usr/local/bin/kind ]; then
	# For AMD64 / x86_64
	[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.19.0/kind-linux-amd64
	# For ARM64
	[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.19.0/kind-linux-arm64
	chmod +x ./kind
	sudo mv ./kind /usr/local/bin/kind
else
	echo "kind already installed"
fi


if [ ! -f /usr/local/bin/kubectl ]; then
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
	 curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
	 echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
	 sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
	 rm kubectl kubectl.sha256
else
	echo "kubectl already installed"
fi

if [ ! -f /usr/local/bin/helm ]; then
	curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
else
	echo "helm already installed"
fi
