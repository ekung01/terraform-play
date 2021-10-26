data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"] # don't get confuse with the number owner b/c it's not an open soure service but amazons
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # sping up an ec2 and get this change the date and pu the *
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"] #sping up an ec2 and get this information
  }
}
