# terraform

Terraform workshop based on step-by-step tutorial:
- https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180

## Commands

Useful commands in dev/prod envs:
- `./terraform.sh dev` - print help
- `./terraform.sh dev fmt` - format configuration
- `./terraform.sh dev init` - init terraform modules (.terraform/)
- `./terraform.sh dev plan` - show changes in the current infrastructure
- `./terraform.sh dev apply` - deploy the resources to the cloud (tfstate)
- `./terraform.sh dev destroy` - remove the resources from the cloud (tfstate)
- `./terraform.sh dev validate` - check whether the configuration is valid or not
