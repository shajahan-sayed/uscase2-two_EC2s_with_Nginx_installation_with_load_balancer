variable "aws_region" {
  description = "aws region to deploy resource"
  type = string
}
variable "instnace_type" {
  description = "attaching instance type"
  type = string
}
variable "ami_id" {
  description = "attaching ami id "
  type = string
}
variable "key_name" {
  description = "attaching key name"
  type = string
}
variable "vpc_Nginx2_cidr" {
  description = "cidr block for vpc"
  type = string
}
variable "Nginx2_cidr_pub1" {
  description = "cidr block for subnet1"
  type = string
}
variable "Nginx2_cidr_pub2" {
  description = "cidr block for subnet2"
  type = string
}
