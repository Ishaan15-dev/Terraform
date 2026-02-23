region           = "ap-southeast-1"
template_name    = "Dev-Attendance-lt"
instance_type    = "t2.micro"
key_name         = "API-KEY"
env              = "dev"
owner            = "Kawalpreet kour"
project_name     = "OTMS"
application_name = "Attendance-App"
ami_id           = "ami-0a2fc2446ff3412c3"
cost_center      = "CC-101"

asg_name           = "dev-otms-attendance-asg"
desired_capacity   = 1
max_size           = 3
min_size           = 1
launch_template_id = null
lt_version         = "$Latest"

tg_name     = "dev-attendance-target-group"
port        = 8080
protocol    = "HTTP"
target_type = "instance"

health_check_interval = 20
health_check_path     = "/api/v1/attendance/health"
health_check_protocol = "HTTP"
health_check_timeout  = 5
healthy_threshold     = 2
unhealthy_threshold   = 2


enable_asg_policy                = true
asg_policy_name                  = "scale-policy"
asg_policy_type                  = "TargetTrackingScaling"
estimated_instance_warmup        = 300
predefined_metric_type           = "ASGAverageCPUUtilization"
asg_policy_target_value          = 50.0
step_adjustment_type             = "ChangeInCapacity"
step_metric_interval_lower_bound = 0
step_scaling_adjustment          = 1

alb_listener_action   = "forward"
enable_http_listener  = true
enable_https_listener = false
certificate_arn       = ""

listener_rules = [
  {
    path_pattern = "/api/v1/attendance*"
    rule_name    = "dev-attendance-listener-rule"
    priority     = 8
  }
]
