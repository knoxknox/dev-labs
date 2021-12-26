locals {
  env = "production"
}

provider "aws" {
  region = "us-west-2"
}

module "example" {
  env    = local.env
  source = "../../modules/example"
}
