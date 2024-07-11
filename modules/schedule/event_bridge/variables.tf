variable "name" {
  type = string
}

variable "group_name" {
  type = string
  default = "default"
}

variable "schedule_expression" {
  type = string
}

variable "target_arn" {
  type = string
}

variable "target_role_arn" {
  type = string
}