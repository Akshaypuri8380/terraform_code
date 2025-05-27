resource "aws_instance" "my_ec2_aishu" {
    ami                    = "ami-0e35ddab05955cf57"
    instance_type          = "t2.micro"
     tags = {
    Name = "aishu-instance"
  }
}