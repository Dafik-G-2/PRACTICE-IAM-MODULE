resource "aws_iam_role" "ec2-role-s3" {
  name = var.role_name
  assume_role_policy = jsonencode(
    {
        "Version" = "2012-10-17",
        Statement = [
            {
                "Effect" : "Allow",
                "Action" : "sts:AssumeRole",
                "Principal" = {
                    "Service" = "ec2.amazonaws.com"
                }
            }
        ]
    }
  )
  tags = {
    Environment = var.environment
    name = var.role_name
  }
}
resource "aws_iam_policy" "s3-read-only" {
  name = var.policy_name
  policy = jsonencode(
    {
        "Version" = "2012-10-17",
        "Statement" = [
            {
                "Effect" : "Allow",
                "Action" : [
                    "s3:GetObject",
                    "s3:ListObject"
                ]
                "Resource" : "arn:aws:s3:::${var.s3-bucket-name}"
            }
        ]
    }
  )
  tags = {
    Name = var.policy_name
    Environment = var.environment
  }
}
resource "aws_iam_role_policy_attachment" "policy-attach" {
  policy_arn = aws_iam_policy.s3-read-only.arn
  role = aws_iam_role.ec2-role-s3.name
}
