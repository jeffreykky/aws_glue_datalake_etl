locals {
    prefix = "terraform-standard-datalake-etl"
    raw_layer_bucket_name = "${local.prefix}-raw-layer"
    bronze_layer_bucket_name = "${local.prefix}-bronze-layer"
    silver_layer_bucket_name = "${local.prefix}-silver-layer"
    gold_layer_bucket_name = "${local.prefix}-gold-layer"
    code_bucket_bucket_name = "${local.prefix}-code-repo"
    table_list = [
      {"table_name": {"S": "table1"}, "layer": {"S": "bronze"}},
    ]
    tags = {
        env = "dev"
    }
}

module "storage" {
  source = "./storage"
  raw_layer_bucket_name = local.raw_layer_bucket_name
  bronze_layer_bucket_name = local.bronze_layer_bucket_name
  silver_layer_bucket_name = local.silver_layer_bucket_name
  gold_layer_bucket_name = local.gold_layer_bucket_name
  code_bucket_bucket_name = local.code_bucket_bucket_name
  tags = local.tags
}


module "glue" {
  source = "./glue"
  code_bucket = module.storage.buckets.code_bucket.bucket
  glue_job_execute_role = module.security.roles.glue_job_execute_role.arn
}

module "security" {
  source = "./security"
}

module "orchestrator" {
  source = "./orchestration"
  step_function_execute_role = module.security.roles.step_function_execute_role.arn
}

module "dynamnodb" {
  source = "./dynamodb"
  tags = local.tags
}