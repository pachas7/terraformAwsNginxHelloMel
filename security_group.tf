resource "aws_security_group" "allow_access" {
  name        = "allow_access"
  description = "Allow inbound traffic"

dynamic "ingress" {
    for_each = var.inbound_port
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_access"
  }
}