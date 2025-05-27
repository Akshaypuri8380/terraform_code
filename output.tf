output "instace_ip" {
  description = "Public IP of the Aishu instance"
    value = aws_instance.aishu_instance.public_ip
}