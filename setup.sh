# Initiating Terraform
terraform init
sleep 5

# Applying Terraform Changes
terraform apply -auto-approve
sleep 15

# Deploying Ansible Configurations
ansible-playbook configure.yaml
echo "Success"
