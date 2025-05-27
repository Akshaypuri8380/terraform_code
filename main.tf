#ec2 instance with nginx and security group
resource "aws_key_pair" "aishu_key" {
  key_name   = "aishu_key"
   public_key = file("C:/Users/ASUS/.ssh/id_rsa.pub")
  tags = {
    Name = "AishuKeyPair"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "DefaultVPC"
  }
}

resource "aws_security_group" "aishu_sg" {
  name        = "aishu_sg"
  description = "Security group for Aishu instance"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

  ingress {
    from_port   = 443
    to_port     = 443
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
    Name = "AishuSecurityGroup"
  }
}

resource "aws_instance" "aishu_instance" {
  ami           = "ami-0e35ddab05955cf57"
  key_name      = aws_key_pair.aishu_key.key_name
  security_groups = [aws_security_group.aishu_sg.name]
  instance_type = var.instance_type
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }
 user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  tags = {
    Name = "Aishu_naginx_instance"
  }
}

