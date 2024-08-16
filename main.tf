resource "aws_instance" "ec2-mysqldb-connect" {
  ami             = "ami-0ae8f15ae66fe8cda"
  instance_type   = "t2.micro"
  security_groups = [aws_default_security_group.default.name]
  key_name        = aws_key_pair.db-connect-key.key_name
  #user_data       = file("server-config.sh")
  tags = {
    Name = "ec2-mysql"
  }
}

/*
resource "aws_ebs_volume" "vol1" {
  availability_zone = aws_instance.server1.availability_zone
  size              = 30

  tags = {
    Name = "Dev-Volume"
  }
  
}

resource "aws_volume_attachment" "att1" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.vol1.id
  instance_id = aws_instance.server1.id
}


resource "local_file" "file1" {
  filename = "test.txt"
  content = "hello Serge"
}
*/