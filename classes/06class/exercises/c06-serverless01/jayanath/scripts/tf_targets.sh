#!/bin/bash

# Store the terraform plan
TF_PLAN=doa_serverless.tfplan

# Terraform init, plan and apply
function apply() {
    terraform init
    terraform plan -out=${TF_PLAN}
    terraform apply -auto-approve ${TF_PLAN}
}

# Terraform destroy
function clean() {
    terraform destroy -auto-approve
}

for input in "$@"
do
    case "$input" in
        "deploy")
            echo "Starting terraform init, plan and deploy process"
            apply
            ;;
        "clean")
            echo "Starting terraform destroy process"
            clean
            ;;
        *)
            echo "Try tf_targets.sh {deploy | clean}"
            ;;
    esac
done



# if [ ${#} -eq 0 ]; then
#     echo "Try tf_targets.sh {deploy | clean}"
#     exit 1

# elif [ ${1} == 'deploy' ]; then
#     echo "Starting terraform init, plan and deploy process"
#     apply
#     exit

# elif [ ${1} == 'clean' ]; then
#     echo "Starting terraform destroy process"
#     clean
#     exit
# else
#     echo "Try tf_targets.sh {deploy | clean}"
#     exit 1
# fi