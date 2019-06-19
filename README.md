# kubeflow-aws-eks-gpu

## Setup
Install kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl
Install awscli
Install eksctl
Install aws-iam-authenticator
Install jq
Install ksonnet

## Kubeflow Installation
```
export KUBEFLOW_SRC=/tmp/kubeflow-aws
export KUBEFLOW_TAG=v0.5-branch

mkdir -p ${KUBEFLOW_SRC} && cd ${KUBEFLOW_SRC}
curl https://raw.githubusercontent.com/kubeflow/kubeflow/${KUBEFLOW_TAG}/scripts/download.sh | bash
```

