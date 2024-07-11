output "buckets" {
    value = {
        bronze_layer=module.bronze_layer.bucket
        silver_layer=module.silver_layer.bucket
        gold_layer=module.gold_layer.bucket
        code_bucket = module.code_bucket.bucket
    }
}