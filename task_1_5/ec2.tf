locals {
  name_prefix = "${var.project_name} - ${var.env}"
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "my_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_sensitive_file" "this" {
  content  = tls_private_key.rsa.private_key_openssh
  filename = "./sshkey-${aws_key_pair.key_pair.key_name}"
}

data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

output "test" {
  value = data.aws_ami.ubuntu.id
}

resource "aws_instance" "this" {
  for_each      = var.instance_configs
  ami           = data.aws_ami.ubuntu.id
  instance_type = each.value
  key_name      = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]

  user_data = file("user-data.sh")

  lifecycle {
      ignore_changes = [user_data]
   }


  tags = {
    Name = "${local.name_prefix} - ${each.key} - ec2"
  }
}
