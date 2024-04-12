variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-03103d9f6625af258"
}

variable "vpc_subnet_id" {
  description = "VPC Subnet ID"
  default     = "subnet-0552bc50de561d35e"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  default     = "test_instance"
}

variable "public_key_path" {
  description = "Path to the public key file"
  default     = "/opt/key.pub"
}