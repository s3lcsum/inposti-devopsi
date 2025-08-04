# DevOps Infrastructure Task - Job Interview Requirements

## Project Structure

```
├── argocd-applicationsets/     # ArgoCD ApplicationSet manifests
├── argocd-instance/           # ArgoCD self-management Helm chart
├── charts/
│   ├── infrastructure/        # Core Kubernetes infrastructure charts
│   ├── runtime/              # Client platform specific charts
│   └── values/               # Environment-specific value overrides
├── terraform/
│   ├── modules/              # Reusable Terraform modules
│   ├── networking/           # Network infrastructure
│   ├── engineering/          # Internal tooling
│   └── runtime/              # Client-specific infrastructure
└── .github/workflows/        # CI/CD automation
```
