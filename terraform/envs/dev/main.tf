locals {
  env = "staging"
}

provider "aws" {
  region = "us-west-2"
}

module "example" {
  source = "../../modules/example"

  env = local.env
  ec2_type = "t2.micro"
  cluster_ec2_min_size = 1
  cluster_ec2_max_size = 1
  cluster_name = "example-server-${local.env}"
}
