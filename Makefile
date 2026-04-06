
build-cluster:
	@curl -sfL https://get.k3s.io | sh -s - --disable=traefik --node-label juno-innovations.com/service=true

install-argo:
	@kubectl create namespace argocd
	@kubectl create -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	@echo "Waiting for Argo CD to be ready..."
	@sleep 30

install-nginx:
	@kubectl apply -f ./nginx.yaml
	@echo "Waiting for Argo CD to be ready..."
	@sleep 30

install-juno:
	@bash ./install.sh

juno: build-cluster install-argo install-nginx install-juno
