#!/bin/bash
set -x

echo "Logging into ECR"
aws ecr get-login-password --region ap-south-1 | \
docker login --username AWS --password-stdin 311153964827.dkr.ecr.ap-south-1.amazonaws.com

echo "Deploying docker stack"
docker stack deploy \
  --with-registry-auth \
  --resolve-image always \
  -c docker-stack.yml demo-backend

echo "Deployment completed"
