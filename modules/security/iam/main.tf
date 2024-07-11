resource "aws_iam_role" "role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [ for principal in var.assume_role_principal: {
        Effect = "Allow",
        Principal = {
          Service = principal
        },
        Action = "sts:AssumeRole",
      }]
  })
}

resource "aws_iam_policy" "policy" {
  name        = "${var.role_name}_policy"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = var.policy_statement
  })
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}