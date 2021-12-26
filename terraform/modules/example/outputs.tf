output "dns_name" {
  value = aws_elb.example.dns_name
  description = "DNS name of the load balancer"
}
