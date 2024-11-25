
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
      },
      {
        Action = ["s3:GetObject", "s3:PutObject", "s3:ListBucket"]
        Effect = "Allow"
        Resource : [
          "arn:aws:s3:::hetzner-terraform-state",
          "arn:aws:s3:::hetzner-terraform-state/*"
        ]
      },
      {
        Action = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:UpdateItem", "dynamodb:DeleteItem"]
        Effect = "Allow"
        Resource : "arn:aws:dynamodb:eu-central-1:211125336879:table/terraform_state"
      }
    ]
  })
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}
