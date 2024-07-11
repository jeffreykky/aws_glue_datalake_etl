# Step Function IAM Role
module "step_function_execute_role" {
  source = "/modules/security/iam"
  role_name = "step_function_execute_role"

  assume_role_principal = ["states.amazonaws.com", "scheduler.amazonaws.com"]
  policy_statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::*"
        ],
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Effect = "Allow",
        Action = [
          "*"
        ],
        Resource = "*"
      }
    ]
}