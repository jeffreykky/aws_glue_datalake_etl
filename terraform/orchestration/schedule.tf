# module "sfn_test_schedule" {
#   source = "/modules/schedule/event_bridge"
#   name = "sfn_test_schedule"
#   target_arn = aws_sfn_state_machine.sfn_state_machine["1_raw_to_bronze"].arn
#   target_role_arn = var.step_function_execute_role
#   schedule_expression = "rate(50 minutes)"
# }