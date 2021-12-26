locals {
  # Ubuntu 18.04 LTS AMI ID
  image_id = "ami-0c55b159cbfafe1f0"
}

data "aws_availability_zones" "all" {}

##
# Security group for ELB.
#
resource "aws_security_group" "elb" {
  name = "${var.cluster_name}-elb"

  egress {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    to_port = 80
    from_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

##
# Security group for EC2 instances.
#
resource "aws_security_group" "instance" {
  name = "${var.cluster_name}-instance"

  ingress {
    to_port = 8080
    from_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

##
# ELB that proxies incoming traffic to EC2 instances.
#
resource "aws_elb" "example" {
  name = var.cluster_name
  security_groups = [aws_security_group.elb.id]
  availability_zones = data.aws_availability_zones.all.names

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = 8080
    instance_protocol = "http"
  }

  health_check {
    timeout = 3
    interval = 30
    target = "HTTP:8080/"
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

##
# ASG which controls number of working EC2 instances.
#
resource "aws_autoscaling_group" "example" {
  availability_zones = data.aws_availability_zones.all.names
  launch_configuration = aws_launch_configuration.example.id

  min_size = var.cluster_ec2_min_size
  max_size = var.cluster_ec2_max_size

  health_check_type = "ELB"
  load_balancers = [aws_elb.example.name]

  tag {
    key = "Name"
    value = var.cluster_name
    propagate_at_launch = true
  }
}

##
# LCG which runs each time when new EC2 instance created.
#
resource "aws_launch_configuration" "example" {
  image_id = local.image_id
  instance_type = var.ec2_type
  security_groups = [aws_security_group.instance.id]

  lifecycle {
    create_before_destroy = true
  }

  user_data = "echo 'OK' > index.html && nohup busybox httpd -f -p 8080 &"
}
