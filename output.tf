output "balu_instance_public_ip" {
 description = "instance public ip of balu"
 value = aws_instance.Nginx_balu.public_ip
}
output "shajahan_instance_public_ip" {
 description = "instance public ip of Shajahan"
 value = aws_instance.Nginx_shajahan.public_ip
}
