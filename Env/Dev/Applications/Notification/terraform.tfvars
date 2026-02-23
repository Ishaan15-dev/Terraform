env                     = "dev"
application             = "otms"
owner                   = "apt-get-swag"
cost_center             = "CC-101"

template_name           = "notification-AMI"
ami_id                  = "ami-0bb3399dd5c1b646a"
instance_type           = "t3.micro"
key_name                = "API-KEY"

asg_name                = "notification_ASG"
desired_capacity        = 1
min_size                = 0
max_size                = 2

tg_name                 = "notification-TG"
port                    = 9200
health_check_path       = "/"

certificate_arn         = ""
enable_https_listener   = false

listener_rules = [
  {
    path_pattern = "/*"
    rule_name    = "dev-notification-listener-rule"
    priority     = 10
  }
]

alb_listener_action     = "forward"

enable_asg_policy       = true
asg_policy_target_value = 60
