# HWC-3-Expanded
 Expanding on the Previous HWC-2 Repo to utilise 3 Musketeers, adapting the A Cloud Guru Sandbox to utilise AWS instances to run dockerised containers in an EKS environment. 

 ## Local User Instructions:

**Pre-requisites**
* Terraform installed locally.
* ACG AWS Sandbox created.

**Instructions**
* Update $HOME/.aws/config and $HOME/.aws/credentials with both AWS secret ID and AWS secret key updating with the latest ACG credentials, for Terraform to pull for the latest credentials.
* cd into TF folder
* Update tfvars region for ACG AWS region.
* Run terraform init to initialise the directory for Terraform use.
* Run terraform plan for build plans.
* Run terraform apply to deploy the infrastructure.
The automation of the resource and scripting should provide the resources for use. Give time for the scripts to install and complete, once the apply has been successful, allow 5-10 minutes for all services to become available. Once available Kibana should be accessible from the Ec2 instances public IP on port 5061.

## GHA Automation Instructions: 

**Pre-requisites**
* Self hosted rhel runner available within Github account.
* ACG AWS Sandbox created.
* AWS access and secret credentials stored within Github for the GHA workflow to access.


  
