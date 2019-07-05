# kubeflow-aws-eks-gpu

## Dependencies
Install kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl  
Install awscli, eksctl, aws-iam-authenticator, jq, ksonnet

## AWS Setup
`aws configure` and enter access key ID, secret, region, default output

## Kubeflow Installation

### Customize EKS Cluster Parameters
* Edit instance types and other cluster details in:
`files/cluster_config.yaml`

### Launch EKS Cluster with Kubeflow
run `init_kubeflow.sh`
* AWS_CLUSTER_NAME - Specify a unique name for your Amazon EKS cluster.
* KFAPP - Use a relative directory name here rather than absolute path, such as kfapp.
* REGION - Use the AWS Region you want to create your cluster in.

## Local Setup
Install vagrant and virtual box
```
vagrant init arrikto/minikf
vagrant up
```
visit http://10.10.10.10
