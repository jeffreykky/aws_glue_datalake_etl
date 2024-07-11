# Raw layer

module "raw_layer" {
  source = "/modules/storage/s3_bucket"
  bucket = var.raw_layer_bucket_name
  tags = var.tags
}

# Bronze layer

module "bronze_layer" {
  source = "/modules/storage/s3_bucket"
  bucket = var.bronze_layer_bucket_name
  tags = var.tags
}

# Silver layer
module "silver_layer" {
  source = "/modules/storage/s3_bucket"
  bucket = var.silver_layer_bucket_name
  tags = var.tags
}

# Gold layer
module "gold_layer" {
  source = "/modules/storage/s3_bucket"
  bucket = var.gold_layer_bucket_name
  tags = var.tags
}

# Code storage
module "code_bucket" {
  source = "/modules/storage/s3_bucket"
  bucket = var.code_bucket_bucket_name
  tags = var.tags
}


data "archive_file" "glue_utils_zip_file" {
  type        = "zip"
  output_path = "${path.root}/code/site-packages/archive_folders/utils.zip"
  source_dir = "${path.root}/code/site-packages/utils/"
}
# Sync code folder to s3 bucket
resource "aws_s3_object" "code" {
  for_each = fileset("${path.root}/code", "**")
  bucket = module.code_bucket.bucket.id
  key    = "code/${each.value}"
  source = "${path.root}/code/${each.value}"
  acl    = "private"
  etag    = filemd5("${path.root}/code/${each.value}") 

  depends_on = [ data.archive_file.glue_utils_zip_file ]
}