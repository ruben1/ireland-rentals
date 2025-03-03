resource "aws_apprunner_service" "metabase" {
  service_name = "metabase"
 
  health_check_configuration {
    interval            = 15
    path                = "/api/health"
    timeout             = 5
    unhealthy_threshold = 5
  }
 
  instance_configuration {
    cpu               = "1024"
    memory            = "2048"
  }
 
  network_configuration {
    ingress_configuration {
      is_publicly_accessible = true
    }
  }
 
  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.metabase_build.arn
    }
    
    image_repository {
      image_configuration {
        port = "3000"
        runtime_environment_variables = {
          MB_DB_TYPE = "postgres"
          MB_DB_DBNAME = "postgres"
          MB_DB_PORT = "5432"
          MB_DB_USER = "${var.metabase_db_user}"
          MB_DB_PASS = "${var.metabase_db_password}"
          MB_DB_HOST = "aws-0-eu-central-1.pooler.supabase.com"
        }
      }
 
      image_identifier      = local.metabase_ecr_tag
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = true
  }
 
}
 
output "metabase_url" {
  value = aws_apprunner_service.metabase.service_url
}