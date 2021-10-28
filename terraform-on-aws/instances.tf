# create public instance
resource "aws_instance" "pub_sub1" {
  ami = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  key_name = var.key-pair
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra_pub_sub1.id
  security_groups = [aws_security_group.terra_web_sg.id]
}

# create private instance
resource "aws_instance" "priv_sub1" {
  ami = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  key_name = var.key-pair
  subnet_id = aws_subnet.terra_priv_sub1.id
  security_groups = [aws_security_group.terra_web_sg.id]
}