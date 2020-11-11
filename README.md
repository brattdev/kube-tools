# kube-tools

[![Docker](https://img.shields.io/badge/Docker%20Hub-systemctldev%2Fkube--tools-blue)](https://hub.docker.com/r/systemctldev/kube-tools)

Github Action with Kubernetes tools: kubectl, helm, jq, awscli

GitHub Workflow example:

```yaml
name: CI

on: [push, pull_request]

jobs:
  test-action:
    runs-on: ubuntu-latest
    steps:
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-2

      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v1

      - uses: actions/checkout@v2
        name: Run Kubernetes tools
        uses: systemctldev/kube-tools@v1
        with:
          kubectl: 1.18.4
          helm: 3.3.0
          awscli: 2.0.30
          command: |
            echo "Run conftest"
            echo "Configure Kubernetes"
            aws eks update-kubeconfig --name cactus-eksctl
```
