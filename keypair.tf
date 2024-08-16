resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
#Create the Key Pair
resource "aws_key_pair" "db-connect-key" {
  key_name   = "ec2-mysql"
  public_key = tls_private_key.ec2_key.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename = "ec2-mysql.pem"
  content  = tls_private_key.ec2_key.private_key_pem
}