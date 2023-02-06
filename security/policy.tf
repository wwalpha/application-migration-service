# ----------------------------------------------------------------------------------------------
# AWS EC2 Role Policy - SSM
# ----------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "ec2_mgn" {
  role       = aws_iam_role.ec2_mgn.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
