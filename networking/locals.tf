locals {
  availability_zones             = ["ap-northeast-1a", "ap-northeast-1d"]
  vpc_cidr_block_src             = "10.10.0.0/16"
  vpc_cidr_block_dst             = "10.20.0.0/16"
  public_subnets_cidr_block_src  = ["10.10.0.0/24", "10.10.1.0/24"]
  private_subnets_cidr_block_src = ["10.10.2.0/24", "10.10.3.0/24"]
  public_subnets_cidr_block_dst  = ["10.20.0.0/24", "10.20.1.0/24"]
  private_subnets_cidr_block_dst = ["10.20.2.0/24", "10.20.3.0/24"]
}
