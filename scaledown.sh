#!/bin/sh
#
# Make sure that you have <clustername> going already, and that you have run this:
#   aws-vault exec sandbox-admin -- aws eks --region us-west-2  update-kubeconfig --name clustername
#

echo "scaling down pods"
aws-vault exec sandbox-admin -- kubectl scale deployment coredns --replicas=10 --namespace=kube-system
aws-vault exec sandbox-admin -- kubectl scale deployment oidc-sinatra --replicas=1 --namespace=oidc-sinatra

echo "scale the nodes in the cluster down to 6 or so"
echo "change the locust-worker replicas in locust.yaml to 5, push it up there."

