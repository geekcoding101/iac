
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = var.ami_owners

  filter {
    name   = "name"
    values = [var.ami_filter_name]
  }
}

resource "aws_instance" "module_tutorial_ec2" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name_tag
    Environment = var.environment
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo amazon-linux-extras enable nginx1
              sudo yum clean metadata
              sudo yum install -y nginx
              sudo systemctl start nginx
              EOF
  
  provisioner "local-exec" {
    command = <<EOT
      mkdir -p ${var.output_dir}
      echo "Public IP: ${self.public_ip}" > ${var.output_dir}/${var.output_file}
      echo "Private IP: ${self.private_ip}" >> ${var.output_dir}/${var.output_file}
      echo "Instance ID: ${self.id}" >> ${var.output_dir}/${var.output_file}
    EOT
  }
}