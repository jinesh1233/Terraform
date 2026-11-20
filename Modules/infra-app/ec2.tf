resource aws_key_pair my_key {
    key_name = "${var.env}-infra-key"
    public_key = file("terra-key.pub")
    tags = {
        Name = "${var.env}-infra-key"
        Environment = var.env
    }
}

# vpc & security group
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }
}
resource "aws_security_group" "my_sg" {
  name        = "${var.env}-infra-sg"
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
    Name = "${var.env}-infra-sg"
    Environment = var.env
  }
}

# ec2 instance
resource "aws_instance" "my_instance" {
    key_name = aws_key_pair.my_key.key_name
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    vpc_security_group_ids = [aws_security_group.my_sg.id]

    count = var.instance_count
    depends_on = [aws_key_pair.my_key, aws_security_group.my_sg]
    
    
    root_block_device {
        volume_size = var.env == "dev" ? 10 : var.ec2_root_storage_size
        volume_type = "gp3"
    }
    tags = {
        Name = "${var.env}-infra-instance-${count.index + 1}"
        Environment = var.env
    }
    
}

