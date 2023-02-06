# ----------------------------------------------------------------------------------------------
# AWS Role - EC2
# ----------------------------------------------------------------------------------------------
resource "aws_iam_role" "ec2_mgn" {
  name               = "${var.prefix}_EC2_MGNRole"
  assume_role_policy = data.aws_iam_policy_document.ec2.json

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_iam_instance_profile" "ec2_mgn" {
  name = "ec2_mgn"
  role = aws_iam_role.ec2_mgn.name
}
