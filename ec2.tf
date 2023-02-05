data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "hello-world" {
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type
  key_name               = "terraform"
  vpc_security_group_ids = [aws_security_group.allow_access.id]
  user_data              = file("./user-data/init.sh")
}

output "instance_details" {
  description = "DNS to Access"
  value       = aws_instance.hello-world.public_ip
}
