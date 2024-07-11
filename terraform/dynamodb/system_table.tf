resource "aws_dynamodb_table" "system_table" {
  name           = "system_table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "layer"
  range_key      = "schema"

  attribute {
    name = "layer"
    type = "S"
  }

  attribute {
    name = "schema"
    type = "S"
  }

  ttl {
    enabled        = false
  }

  tags = var.tags

}