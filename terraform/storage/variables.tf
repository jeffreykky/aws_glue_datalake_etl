variable "tags" {
  type=map(string)
  default = {}
}

variable "raw_layer_bucket_name" {
  type=string
  default = ""
}

variable "bronze_layer_bucket_name" {
  type=string
  default = ""
}

variable "silver_layer_bucket_name" {
  type=string
  default = ""
}

variable "gold_layer_bucket_name" {
  type=string
  default = ""
}

variable "code_bucket_bucket_name" {
  type=string
  default = ""
}

