#!/usr/bin/env bash

set -o errexit

echo "downloading zip"
apt update
apt install -y zip

AWSCLI=2.0.30
echo "downloading awscli ${KUBECTL}"
curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWSCLI}.zip -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

KUBECTL=1.18.2
echo "downloading kubectl ${KUBECTL}"
curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL}/bin/linux/amd64/kubectl \
-o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
kubectl version --client

HELM_V2=2.16.7
echo "downloading helm ${HELM_V2}"
curl -sSL https://get.helm.sh/helm-v${HELM_V2}-linux-amd64.tar.gz | \
tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64
helm version --client

HELM_V3=3.2.1
echo "downloading helm ${HELM_V3}"
curl -sSL https://get.helm.sh/helm-v${HELM_V3}-linux-amd64.tar.gz | \
tar xz && mv linux-amd64/helm /usr/local/bin/helmv3 && rm -rf linux-amd64
helmv3 version

echo "downloading jq"
curl -sL https://github.com/stedolan/jq/releases/latest/download/jq-linux64 \
-o /usr/local/bin/jq && chmod +x /usr/local/bin/jq
jq --version

echo "downloading grep"
apt install -y grep
grep --version
