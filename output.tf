# create and output from vonfigured resource
output "publ1-instance_id" {
  description = "ID of the public EC2 instance"
  value       = aws_instance.pub_sub1.id
}

output "Priv-instance_id" {
  description = "ID of the private EC2 instance"
  value       = aws_instance.priv_sub1
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.pub_sub1.public_ip
}



