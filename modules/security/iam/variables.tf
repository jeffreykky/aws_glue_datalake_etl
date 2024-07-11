variable "role_name" {
  type = string
}

variable "assume_role_principal" {
  # type = map(string)
  default = {}
}

variable "policy_statement" {
}