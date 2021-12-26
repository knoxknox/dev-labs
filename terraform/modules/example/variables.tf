variable "env" {
  type = string
  description = "Current environment"
}

variable "ec2_type" {
  type = string
  description = "Type of EC2 instances to run (ex: t2.micro)"
}

variable "cluster_name" {
  type = string
  description = "The name to use for all the cluster resources"
}

variable "cluster_ec2_min_size" {
  type = number
  description = "The minimum number of EC2 instances in the ASG"
}

variable "cluster_ec2_max_size" {
  type = number
  description = "The maximum number of EC2 instances in the ASG"
}
