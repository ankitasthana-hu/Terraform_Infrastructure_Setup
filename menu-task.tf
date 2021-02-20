data "template_file" "myapp-task-definition-template" {
  template               = "${file("templates/app.json.tpl")}"
  vars = {
    REPOSITORY_URL = "${replace("${aws_ecr_repository.myapp.repository_url}", "https://", "")}"
    APP_VERSION = "latest"
  }
}

resource "aws_ecs_task_definition" "myapp-task-definition" {
  family                = "myapp"
  container_definitions = "${data.template_file.myapp-task-definition-template.rendered}"
}
