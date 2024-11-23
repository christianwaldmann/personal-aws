
resource "aws_iam_user" "this" {
  name = "packer-user"
}

resource "aws_iam_user_policy" "this" {
  name = "packer-policy"
  user = aws_iam_user.this.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ssm:GetParameter", "ssm:GetParameters", "ssm:DescribeParameters"]
        Effect   = "Allow"
        Resource = "arn:aws:ssm:eu-central-1:211125336879:parameter/*"
      }
    ]
  })
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}
