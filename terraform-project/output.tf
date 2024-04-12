output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_eip.elastic_ip.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.test_instance.id
}