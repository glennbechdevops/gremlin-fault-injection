resource "aws_ecs_cluster" "cluster" {
  name = "${var.student_name}-cluster"
}

resource "aws_ecs_task_definition" "hello_world" {
  family                   = var.student_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name         = "hello-world"
      image        = "your_ecr_image_url"
      essential    = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
}

resource "aws_ecs_service" "hello_world_service" {
  name            = "hello-world-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.hello_world.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "hello-world"
    container_port   = 80
  }

  network_configuration {
    subnets          = slice(tolist(data.aws_subnet_ids.default.ids), 0, 2)
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = true
  }
  depends_on = [aws_lb_listener.front_end]
}

