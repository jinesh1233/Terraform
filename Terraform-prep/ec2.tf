# key pair
resource aws_key_pair my_key {
    key_name = "${var.environment}-key"
    public_key = file("terra-ec2-key.pub")
}

# vpc & security group
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }
}
resource "aws_security_group" "my_sg" {
  name        = "${var.environment}-automated-sg"
  description = "Security group for automate instances"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "automate-sg"
  }
}

# ec2 instance
resource "aws_instance" "my_instance" {
    key_name = aws_key_pair.my_key.key_name
    ami = var.ec2_ami
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.my_sg.id]

    for_each = tomap({
      instance1 = "t3.micro"
      instance2 = "t3.small"
    })
    depends_on = [aws_key_pair.my_key, aws_security_group.my_sg]
    
    
    root_block_device {
        volume_size = var.environment == "dev" ? 10 : var.ec2_root_storage_size
        volume_type = "gp3"
    }
    user_data = file("install_nginx.sh")
    tags = {
        Name = each.key
    }
    
}

