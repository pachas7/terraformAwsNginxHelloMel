data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "hello-world" {
   ami = data.aws_ami.app_ami.id
   instance_type = var.instance_type
   key_name = "terraform"
   vpc_security_group_ids = [ aws_security_group.allow_access.id ]

   connection {
   type     = "ssh"
   user     = "ec2-user"
   private_key = var.ssh_key
   host     = self.public_ip
    }

 provisioner "remote-exec" {
   inline = [
     "sudo amazon-linux-extras install -y nginx1",
     "sudo systemctl start nginx",
     "sudo chmod 0777 /usr/share/nginx/html/index.html"
     ]
 }
 provisioner "file" {
  source = "./nginx/html/hello_mel.html"
  destination = "/usr/share/nginx/html/index.html"
 }
}

output "instance_details"{
    description = "DNS to Access"
    value = aws_instance.hello-world.public_ip
}
