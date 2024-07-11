# Glue Job IAM Role
module "glue_job_execute_role" {
  source = "/modules/security/iam"
  role_name = "glue_job_execute_role"

  assume_role_principal = ["glue.amazonaws.com"]
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
      }
    ]
}