locals {
    vars = {
      table_list=jsonencode(csvdecode(file("${path.root}/code/config/table_list/table_list.csv")))
    }
}

resource "aws_sfn_state_machine" "sfn_state_machine" {
  for_each = {for file in fileset("${path.root}/code/step_function", "*.json"): trimsuffix(file, ".json")=> file}
  name = each.key
  role_arn = var.step_function_execute_role
  definition = templatefile("${path.root}/code/step_function/${each.value}", local.vars)
}