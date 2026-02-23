region           = "ap-southeast-1"
template_name    = "dev-salary-lt"
instance_type    = "t2.micro"
key_name         = "API-KEY"
env              = "dev"
owner            = "Cloudops-crew"
project_name     = "OTMS"
application_name = "Salary-App"

asg_name           = "dev-otms-salary-asg"
desired_capacity   = 1
max_size           = 3
min_size           = 1
launch_template_id = null
lt_version         = "$Latest"

# Listener rules
listener_rules = [
  {
    path_pattern = "/api/v1/salary/*"
    rule_name    = "dev-salary-listener-rule-1"
    priority     = 2
  }

]

alb_listener_action = "forward"

asg_policy_name                  = "scale-policy"
asg_policy_type                  = "TargetTrackingScaling"
estimated_instance_warmup        = 300
predefined_metric_type           = "ASGAverageCPUUtilization"
asg_policy_target_value          = 50.0
enable_asg_policy                = true
step_adjustment_type             = "ChangeInCapacity"
step_metric_interval_lower_bound = 0
step_scaling_adjustment          = 1

tg_name     = "dev-salary-target-group"
port        = 8080
protocol    = "HTTP"
target_type = "instance"

health_check_interval = 30
health_check_path     = "/api/v1/actuator/health"
health_check_protocol = "HTTP"
health_check_timeout  = 20
healthy_threshold     = 2
unhealthy_threshold   = 2

enable_http_listener = true
