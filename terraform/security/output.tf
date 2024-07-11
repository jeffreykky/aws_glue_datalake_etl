output "roles" {
    value = {
        glue_job_execute_role = module.glue_job_execute_role.role
        step_function_execute_role = module.step_function_execute_role.role
    }
}