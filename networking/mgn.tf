resource "null_resource" "mgn" {
  depends_on = [module.vpc_dst]

  triggers = {
    file_content_md5 = md5(file("${path.module}/scripts/mgn.sh"))
  }

  provisioner "local-exec" {
    command = "sh ${path.module}/scripts/mgn.sh"

    environment = {
      SUBNET_ID = module.vpc_dst.private_subnets[0]
    }
  }
}
