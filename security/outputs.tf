output "iam_role_arn_ec2_mgn" {
  value = aws_iam_role.ec2_mgn.arn
}

output "iam_role_profile_ec2_mgn" {
  value = aws_iam_instance_profile.ec2_mgn.name
}
