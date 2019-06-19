#!/usr/bin/env bash

SCRIPT_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

export AWS_REGION=us-west-2
export AWS_CLUSTER_NAME=kubeflow-aws

export KUBEFLOW_SRC=/tmp/kubeflow-aws
export KUBEFLOW_TAG=v0.5-branch
export KUBEFLOW_APP=kfapp

mkdir -p ${KUBEFLOW_SRC} && cd ${KUBEFLOW_SRC}
curl https://raw.githubusercontent.com/kubeflow/kubeflow/${KUBEFLOW_TAG}/scripts/download.sh | bash

${KUBEFLOW_SRC}/scripts/kfctl.sh init ${KUBEFLOW_APP} --platform aws \
--awsClusterName ${AWS_CLUSTER_NAME} \
--awsRegion ${AWS_REGION}

# Generate platform files
cd ${KUBEFLOW_APP}
KUBEFLOW_APP_ABSO=$(pwd)
${KUBEFLOW_SRC}/scripts/kfctl.sh generate platform

# Move previously defined config files into kubeflow app directory
cd ${SCRIPT_DIR} && cd ../files
cp -r cluster_config.yaml ${KUBEFLOW_SRC}/${KUBEFLOW_APP}/aws_config/cluster_config.yaml
cd ${KUBEFLOW_APP_ABSO}

# Apply platform files
${KUBEFLOW_SRC}/scripts/kfctl.sh apply platform

# Generate and apply Kubernetes changes
${KUBEFLOW_SRC}/scripts/kfctl.sh generate k8s

# Secure Installation
# TODO disable ingress: Open ${KUBEFLOW_SRC}/${KUBEFLOW_APP}/env.sh and edit the KUBEFLOW_COMPONENTS environment variable to delete: ,\"alb-ingress-controller\",\"istio-ingress\"
# TODO add authentication: https://www.kubeflow.org/docs/aws/authentication

# Deploy Kubeflow
${KUBEFLOW_SRC}/scripts/kfctl.sh apply k8s

# Wait for all the resources to become ready in the kubeflow namespace
kubectl -n kubeflow get all