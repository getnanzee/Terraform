# Initiating Terraform
terraform init
sleep 5

# Applying Terraform Changes
terraform apply -auto-approve
sleep 5

# Deploying Ansible Configurations
ansible-playbook configure.yaml
echo "Success"