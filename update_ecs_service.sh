#!/bin/bash -x

set -e

AWS_PROFILE=$1
ECR_REPOSITORY=$2
ECS_CLUSTER=$3
ECS_SERVICE=$4
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)


aws ecr get-login-password --region ap-northeast-1 \
| docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com

docker build --platform linux/amd64 -t frontend .
docker tag $ECR_REPOSITORY:latest $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/$ECR_REPOSITORY:latest
docker push $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/$ECR_REPOSITORY:latest

ECS_CLUSTER_ARN=$(aws ecs describe-clusters --cluster $ECS_CLUSTER --profile developer --region ap-northeast-1 --query 'clusters[0].clusterArn' --output text)

# --output text でないと正常に処理できない
aws ecs update-service \
--cluster $ECS_CLUSTER_ARN \
--service $ECS_SERVICE \
--force-new-deployment \
--region ap-northeast-1 \
--profile developer
