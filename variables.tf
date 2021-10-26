# create a vpc cider block
variable "terra_vpc_cidr_block" {
  description = "vpc network vpc_id"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_region" {
  description = "creating a variable to hold region name value"
  type        = string
  default     = "us-east-1"
}
# create keypair
variable "key-pair" {
  description = "creating a variable to hold keypair name value"
  type        = string
  default     = "my_village-key"
}
variable "instance_type" {
  description = "creating a variable to hold instance type value"
  type        = string
  default     = "t2.micro"
}
# create pub sub cider block
variable "pub_sub1_cidr_block" {
  description = "creating a variable to retain the public subnet cider value"
  type        = string
  default     = "10.0.0.0/24"
}
# create private sub cider block
variable "priv_sub1_cidr_block" {
  description = "creating a variable to hold private subnet cidr_block value"
  type        = string
  default     = "10.0.1.0/24"
}
variable "aws_availability_zone" {
  type        = string
  description = "creating a variable to hold value of private subnet availability zone"
  default     = "us-east-1a"
}
