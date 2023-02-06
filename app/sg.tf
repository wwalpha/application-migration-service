module "src_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name   = "${var.prefix}_src_sg"
  vpc_id = var.vpc_id
  egress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 1500
      to_port     = 1500
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
