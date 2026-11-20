variable "ec2_instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}
variable "ec2_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0b96a5de4855a23d0"
}
variable "ec2_root_storage_size" {
  description = "The root storage size for the EC2 instance"
  type        = number
  default     = 10
}
variable "environment" {
  description = "The environment for the EC2 instance"
  type        = string
  default     = "dev"
}

