resource "aws_instance" "dev_Ins" {
	ami = var.ami_id
	instance_type = var.inst_type
	key_name = var.dev_key_name
	subnet_id = var.dev_subnet_id
	vpc_security_group_ids = [var.sg_id]
	user_data = <<-EOF
		#!/bin/bash
		sudo apt-get update
		sudo apt-get install apache2 -y
		sudo sytemctl start apache2
		sudo systemctl enable apache2
	EOF
	tags = {
		Name = "Dev_Inst"
	}
}

output "dev_Ins_ip" { value = aws_instance.dev_Ins.public_ip }
