locals {
  user_data = <<EOT
#!/bin/bash
yum update -y

mkdir /var/opt/mgn
cd /var/opt/mgn

# download agent
wget -O ./aws-replication-installer-init.py https://aws-application-migration-service-ap-northeast-1.s3.ap-northeast-1.amazonaws.com/latest/linux/aws-replication-installer-init.py

# install agent
python3 aws-replication-installer-init.py --region ap-northeast-1
EOT
}

module "mgn_target" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name                   = "${var.prefix}-source"
  ami                    = "ami-06ee4e2261a4dc5c3"
  instance_type          = "t3a.medium"
  key_name               = "onecloud"
  monitoring             = false
  vpc_security_group_ids = [module.src_sg.security_group_id]
  subnet_id              = var.private_subnets[0]
  user_data_base64       = base64encode(local.user_data)
  iam_instance_profile   = var.iam_role_profile_ec2
}
