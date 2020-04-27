### The following scripts allows you to set up a 3 node cluster of elastic search on AWS using Terraform and Ansible

- Software Pre-requisites
    - Terraform v0.12.19
    - Ansible 2.7.8
    - Python 3.7.1

- Files Included
    - Terraform
        - instance.tf 
        - iam.tf
        - vars.tf
    - Ansible
        - configure.yaml
        - ansible.cfg
    - Bash
        - configuration-file.sh
        - setup.sh

## Usage Instructions:

### Variables

| Parameter     |  Type   | Description           | Default                      | Required |
| ------------- | ------- | --------------------- | ---------------------------- | -------- |
| NODES         | list    | Name of Nodes         | ["master", "node1", "node2"] | Y        |
| PRIVATE_KEY   | string  | SSH Key Name          | elastic                      | Y        |
| PUBLIC_KEY    | string  | SSH Key Name          | elastic.pub                  | Y        |
| REGION        | string  | AWS Region            | us-west-1                    | Y        |
| AMIS          | map     | Region Specific AMIS  |                              | Y        |
| INSTANCE_TYPE | string  | Type of Instance      | t2.medium                    | Y        |
| PROFILE       | string  | Region Specific AMIS  |                              | Y        |

## Execution Steps:

1. Run ssh-keygen utility to generate your ssh keys
    - `ssh-keygen` (hit enter and pass the name mentioned in vars.tf file. Default is **elastic**)
2. Run setup.sh file
    - `chmod +x setup.sh`
    - `./setup.sh`
    - It will execute terraform script to set up the infrastructure
    - It will also execute the ansible playbook to perform the configuration changes on the nodes.
3. Use below command to terminate the resources:
    - `terraform destroy --auto-approve`