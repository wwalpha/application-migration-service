# ----------------------------------------------------------------------------------------------
# AWS VPC
# ----------------------------------------------------------------------------------------------
module "vpc_src" {
  source = "terraform-aws-modules/vpc/aws"

  name                   = "${var.prefix}-src-vpc"
  cidr                   = local.vpc_cidr_block_src
  azs                    = local.availability_zones
  public_subnets         = local.public_subnets_cidr_block_src
  private_subnets        = local.private_subnets_cidr_block_src
  enable_dns_hostnames   = true
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
}

# ----------------------------------------------------------------------------------------------
# AWS VPC
# ----------------------------------------------------------------------------------------------
module "vpc_dst" {
  source = "terraform-aws-modules/vpc/aws"

  name                   = "${var.prefix}-dst-vpc"
  cidr                   = local.vpc_cidr_block_dst
  azs                    = local.availability_zones
  public_subnets         = local.public_subnets_cidr_block_dst
  private_subnets        = local.private_subnets_cidr_block_dst
  enable_dns_hostnames   = true
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
}

# ----------------------------------------------------------------------------------------------
# AWS VPC Peering
# ----------------------------------------------------------------------------------------------
resource "aws_vpc_peering_connection" "this" {
  peer_vpc_id = module.vpc_src.vpc_id
  vpc_id      = module.vpc_dst.vpc_id
  auto_accept = true

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "${var.prefix}_peering"
  }
}
