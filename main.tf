resource "my_key_pair" "aishu_key"{
  key_name = "aishu_key"
  key_public = file("aishu_key.pub") 
}
resource "aws_default_vpc" "default" {
  tags = {
    Name = "DefaultVPC"
  }
}

resource "aws_security_group" "aishu_sg" {
  name        = "aishu_sg"
  description = "Security group for Aishu instance"
  vpc_id = aws_default_vpc.default.id

  ingress = [
    {
      from_port   = 8000
      to_port     = 8000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  ]
  
  egress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Name = "AishuSecurityGroup"
  }
}

resource "aws_instance" "aishu_instance" {
  ami           = "ami-0e35ddab05955cf57"
  key_name  = my_key_pair.aishu_key.key_name
  security_groups = aws_security_group.aishu_sg.name
  instance_type = var.instance_type
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }
  tags = {
    Name = "Aishu_naginx_instance"
  }
}

