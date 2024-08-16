output "public-ip" {
  value = aws_instance.ec2-mysqldb-connect.public_ip
}