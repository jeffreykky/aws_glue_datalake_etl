resource "aws_glue_catalog_database" "bronze_database" {
  name = "bronze"
}

resource "aws_glue_catalog_database" "silver_database" {
  name = "silver"
}

resource "aws_glue_catalog_database" "gold_database" {
  name = "gold"
}

module "raw_to_bronze" {
  source = "/modules/glue/etl_job"
  script_location = "s3://${var.code_bucket}/code/glue/1_raw_to_bronze.py"
  role_arn = var.glue_job_execute_role
  job_name = "1_raw_to_bronze"
  default_arguments = {
    "--extra-py-files" = "s3://${var.code_bucket}/code/site-packages/archive_folders/utils.zip"
  }
}