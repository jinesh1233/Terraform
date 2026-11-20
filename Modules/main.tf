module "dev-infra" {
    source = "./infra-app"
    env = "dev"
    bucket_name = "my-dev-buckett"
    instance_count = 2
    ec2_ami = "ami-0e3ea3dc6b356c29a"
    ec2_instance_type = "t3.micro"
    ec2_root_storage_size = 10
    hash_key = "Student-Id"

    }
module "prod-infra" {
    source = "./infra-app"
    env = "prod"
    bucket_name = "my-prod-buckett"
    instance_count = 2
    ec2_ami = "ami-0e3ea3dc6b356c29a"
    ec2_instance_type = "t3.micro"
    ec2_root_storage_size = 20
    hash_key = "Student-Id"
    
    }
module "staging-infra" {
    source = "./infra-app"
    env = "staging"
    bucket_name = "my-staging-buckett"
    instance_count = 2
    ec2_ami = "ami-0e3ea3dc6b356c29a"
    ec2_instance_type = "t3.micro"
    ec2_root_storage_size = 20
    hash_key = "Student-Id"
    
    }
    