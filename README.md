# Juno From Scratch

Infrastructure repository for deploying a k3s cluster with Argo CD, nginx ingress, and Juno.

## Prerequisites

- **helm**: Required for Argo CD to deploy nginx ingress
  ```bash
  curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  ```

## Quick Start

```bash
# Full setup: k3s + Argo CD + nginx + Juno
make juno

# Individual steps
make build-cluster      # Install k3s (no traefik)
make install-argo       # Install Argo CD (waits ~90s)
make install-nginx      # Deploy nginx ingress via Argo CD (waits ~30s)
make install-juno       # Run install.sh (fetches Juno from GitHub)
```

## Architecture

- **k3s**: Lightweight Kubernetes with no traefik (uses nginx ingress)
- **Argo CD**: GitOps controller for declarative deployments
- **nginx**: Ingress controller running as DaemonSet with hostPort (no LoadBalancer)
- **Juno**: Fetched from `github.com/juno-fx/Juno-Bootstrap` releases via `install.sh`

## Notes

- Run `make install-argo` before `make install-nginx` (nginx is deployed via Argo CD)
- Wait times are approximate - verify pods are running with `kubectl get pods -A`
