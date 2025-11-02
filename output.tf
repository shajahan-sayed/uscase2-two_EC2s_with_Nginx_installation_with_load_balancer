output "load_balancer_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.Nginx_alb.dns_name
}
output "balu_instance_public_ip" {
 description = "instance public ip of balu"
 value = aws_instance.Nginx_balu.public_ip
}
output "shajahan_instance_public_ip" {
 description = "instance public ip of Shajahan"
 value = aws_instance.Nginx_shajahan.public_ip
}
