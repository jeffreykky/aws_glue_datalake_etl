resource "aws_glue_job" "glue_job" {
  name     = var.job_name
  role_arn = var.role_arn
  glue_version = "4.0"

  command {
    name            = "glueetl"
    script_location = var.script_location
  }

  default_arguments = merge({
    "--job-language" = "python"
    "--enable-auto-scaling" = true
    "--enable-continuous-cloudwatch-log" = true
    "--enable-glue-datacatalog" = true
    "--datalake-formats": "delta"
  },
  var.default_arguments)
  
  worker_type = "G.2X"
  max_retries = 0
  number_of_workers = 2

  # connections = []

}

# resource "aws_glue_connection" "example" {
#   connection_properties = {
#     JDBC_CONNECTION_URL = "jdbc:mysql://${aws_rds_cluster.example.endpoint}/exampledatabase"
#     PASSWORD            = "examplepassword"
#     USERNAME            = "exampleusername"
#   }

#   name = "example"

#   physical_connection_requirements {
#     availability_zone      = aws_subnet.example.availability_zone
#     security_group_id_list = [aws_security_group.example.id]
#     subnet_id              = aws_subnet.example.id
#   }
# }