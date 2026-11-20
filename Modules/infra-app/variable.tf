variable "env" {
    description = "The environment for the resources"
    type        = string
}
variable "bucket_name" {
    description = "The name of the S3 bucket"
    type        = string
}
variable "instance_count" {
    description = "Number of EC2 instances to create"
    type        = number
    
}
variable "ec2_ami" {
    description = "The AMI ID for the EC2 instance"
    type        = string
}
variable "ec2_instance_type" {
    description = "The instance type for the EC2 instance"
    type        = string
}
variable "ec2_root_storage_size" {
    description = "The root storage size for the EC2 instance"
    type        = number
}
variable "hash_key" {
    description = "The hash key for the DynamoDB table"
    type        = string
}