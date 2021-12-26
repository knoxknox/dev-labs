# terraform

Terraform workshop based on step-by-step tutorial:
- https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180

## Commands

List of useful commands:
- `./terraform.sh -chdir=example` - print help
- `./terraform.sh -chdir=example fmt` - format configuration
- `./terraform.sh -chdir=example init` - init terraform modules (.terraform/)
- `./terraform.sh -chdir=example plan` - show changes in the current infrastructure
- `./terraform.sh -chdir=example apply` - deploy the resources to the cloud (tfstate)
- `./terraform.sh -chdir=example destroy` - remove the resources from the cloud (tfstate)
- `./terraform.sh -chdir=example validate` - check whether the configuration is valid or not
