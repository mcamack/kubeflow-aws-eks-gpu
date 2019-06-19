# kubeflow-aws-eks-gpu

## Dependencies
Install kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl
Install awscli
Install eksctl
Install aws-iam-authenticator
Install jq
Install ksonnet

## AWS Setup
`aws configure` and enter access key ID, secret, region, default output

## Kubeflow Installation

### Customize EKS Cluster
* Edit instance types and other cluster details in:
`files/cluster_config.yaml`

### run init_kubeflow.sh
* AWS_CLUSTER_NAME - Specify a unique name for your Amazon EKS cluster.
* KFAPP - Use a relative directory name here rather than absolute path, such as kfapp.
* REGION - Use the AWS Region you want to create your cluster in.
