output "app_public_ip" {
  value = aws_instance.app-ec2.public_ip
}

output "mongodb" {
  value = aws_instance.app-mongdb.private_ip
}