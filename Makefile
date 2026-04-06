
build-cluster:
	curl -sfL https://get.k3s.io | sh -s - --disable=traefik --node-label juno-innovations.com/service=true

install-argo:
	kubectl create namespace argocd
	kubectl create -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

install-nginx:
	kubectl apply -f ./nginx.yaml

install-juno:
	curl -sL "$(curl -s https://api.github.com/repos/juno-fx/Juno-Bootstrap/releases/latest | grep browser_download_url | grep orion-install-helper | cut -d '"' -f 4)" | bash -
