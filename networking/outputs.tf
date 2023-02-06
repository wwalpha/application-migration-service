output "vpc_id_src" {
  value = module.vpc_src.vpc_id
}

output "vpc_id_dst" {
  value = module.vpc_dst.vpc_id
}

# output "public_subnet_ids" {
#   value = module.vpc.public_subnets
# }

output "private_subnet_ids_src" {
  value = module.vpc_src.private_subnets
}

output "private_subnet_ids_dst" {
  value = module.vpc_dst.private_subnets
}


# output "private_subnets_cidr_blocks" {
#   value = module.vpc.private_subnets_cidr_blocks
# }


