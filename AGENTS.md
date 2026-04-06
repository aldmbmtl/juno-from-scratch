# AGENTS.md

## Overview

Infrastructure repository for deploying a k3s cluster with Argo CD, nginx ingress, and Juno.

## Commands

```bash
# Full setup: k3s + Argo CD + nginx + Juno
make juno

# Individual steps
make build-cluster      # Install k3s (no traefik)
make install-argo       # Install Argo CD (waits ~90s)
make install-nginx      # Deploy nginx ingress via Argo CD (waits ~30s)
make install-juno       # Run install.sh (fetches Juno from GitHub)
```

## Notes

- `install.sh` downloads Juno from `github.com/juno-fx/Juno-Bootstrap` releases
- Uses Argo CD for declarative nginx ingress deployment (`nginx.yaml`)
- nginx controller runs as DaemonSet with hostPort enabled (no LoadBalancer)
