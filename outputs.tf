output "build" {
description = "Public IP address of the EC2 instance"
value       = aws_instance.build_server.public_ip
  }
output "stage" {
description = "Public IP address of the EC2 instance"
value       = aws_instance.stage_server.public_ip
  }