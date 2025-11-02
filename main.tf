#creating vpc 
resource "aws_vpc" "Nginx2" {
 cidr_block = var.vpc_Nginx2_cidr

 tags = { 
  Name = "Nginx2"
}

#creating public subnet
resource "aws_subnet" "Nginx2_public_subnet1" {
 vpc_id = aws_vpc.Nginx2.id
 cidr_block = var.Nginx2_cidr_pub1
 availabiilty_zone = "ap-south-1a"
 map_public_ip_on_launch = true

 tags = {
  Name = "Nginx2_public_subnet1"
 }
}
resource "aws_subnet" "Nginx2_public_subnet2" {
 vpc_id = aws_vpc.Nginx2.id
 cidr_block = var.Nginx2_cidr_pub2
 availability_zone = "ap-south-1b"
 map_public_ip_on_launch = true

 tags = {
  Name = "Nginx_public_subnet2"
 }
}

#creating Internet gateway 
resource "aws_internet_gateway" "Nginx2_igw" {
 vpc_id = aws_vpc.Nginx2.id

 tags = {
  Name = "Nginx2_igw"
 }
}

#creating route table 
 resource "aws_route_table" "Nginx2_route_table" {
  vpc_id = aws_vpc.Nginx2.id

  tags = {
   Name = "Nginx2_route_table"
  }
}

#create route to attach internet gateway

resource "route" "Nginx2_route" {
 gateway_id = aws_internet_gateway.Nginx2_igw.id
 cidr_block = "0.0.0.0/0"
}

#associate route table 
resource "aws_route_table_association" "Nginx2_pub1_asso" {
 subnet_id = aws_subnet.Nginx2_public_subnet1.id
 route_table_id = aws_route_table.Nginx2_route_table.id
}
resource "aws_route_table_association" "Nginx2_pub1_asso" {
 subnet_id = aws_subnet.Nginx2_public_subnet2.id
 route_table_id = aws_route_table.Nginx2_route_table.id
}

#creating security group

resource "aws_security_group" "Nginx2_sg2" {
 name = "EC2-sg2"
 description = " Allow SSH and HTTP"
 vpc_id = aws_vpc.Nginx2.id

 ingress {
   description = "Allow SSH port"
   from_port = 22
   to_port = 22
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
  description = "Allow HTTP port"
  from_port = 80
  to_port =80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }

 egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 }

 tags = {
  Name = "EC2-sg2"
 }
}
 
