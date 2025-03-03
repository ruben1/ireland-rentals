locals {
  metabase_ecr_tag = "${aws_ecr_repository.metabase.repository_url}:latest"
}

resource "aws_ecr_repository" "metabase" {
  name                 = "metabase"
  image_tag_mutability = "MUTABLE"
 
  image_scanning_configuration {
    scan_on_push = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
 
resource "terraform_data" "push_image" {
  input = timestamp()
 
  provisioner "local-exec" {
    command = join(" && ", [
      "aws ecr get-login-password | docker login --username AWS --password-stdin ${aws_ecr_repository.metabase.repository_url}",
      "docker pull metabase/metabase:latest",
      "docker tag metabase/metabase:latest ${local.metabase_ecr_tag}",
      "docker push ${local.metabase_ecr_tag}"
    ])
  }
}