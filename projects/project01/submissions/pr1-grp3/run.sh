#!/usr/bin/env bash
set -ueo pipefail

# Target aws environment variables
FUNC="${1:-}"
AWS_REGION="${AWS_REGION:-ap-southeast-2}"
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
ECR_REPO="${ECR_REPO:-pr1-grp3-ecr}"
ecr_registry="${AWS_ACCOUNT_ID}".dkr.ecr."${AWS_REGION}".amazonaws.com
sha=$(git rev-parse --short HEAD)
containerimage="${ecr_registry}"/"${ECR_REPO}":"${sha}"

# Docker compose calls
TERRAFORM="docker-compose run --rm -e TF_VAR_containerimage="${containerimage}"  terraform"
prep-ecr() {
    docker-compose pull terraform
    ${TERRAFORM} init ./terraform/prep_ecr
    ${TERRAFORM} plan -var-file ./terraform/prep_ecr/main.tfvars -out=./terraform/prep_ecr/ecr.plan ./terraform/prep_ecr 
    ${TERRAFORM} apply ./terraform/prep_ecr/ecr.plan
}
push-image() {
    aws ecr get-login-password \
    --region "${AWS_REGION}" | docker login \
    --username AWS --password-stdin "${ecr_registry}"
    docker build -t "${ecr_registry}"/"${ECR_REPO}":${sha} .
    docker push "${ecr_registry}"/"${ECR_REPO}":${sha}
}
refresh-image() {
    aws ecr get-login-password \
    --region "${AWS_REGION}" | docker login \
    --username AWS --password-stdin "${ecr_registry}"
    docker build -t "${ecr_registry}"/"${ECR_REPO}":${sha} .
    docker push "${ecr_registry}"/"${ECR_REPO}":${sha}
    apply-aws
}
apply-aws() {
    docker-compose pull terraform
    ${TERRAFORM} init ./terraform
    ${TERRAFORM} plan -var-file ./terraform/main.tfvars -out=./terraform/terraform-plan ./terraform
    ${TERRAFORM} apply ./terraform/terraform-plan
}
destroy-aws() {
    docker-compose pull terraform
    ${TERRAFORM} destroy  -var-file ./terraform/main.tfvars ./terraform
}
case "${FUNC:-}" in
prep-ecr)
    prep-ecr
    ;;
push-image)
    push-image
    ;;
refresh-image)
    refresh-image
    ;;
apply-aws)
    apply-aws
    ;;
destroy-aws)
    destroy-aws
    ;;        
esac

