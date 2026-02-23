resource "aws_route53_record" "aptgetswag_alb" {
  zone_id = "Z061794326ENHPGAOHIMA"   # Your hosted zone ID
  name    = "sprint.aptgetswag.shop"         # root domain or subdomain
  type    = "A"
  // zone_id = var.hosted_zone_id
  //name    = var.root_domain_name
  //type    = var.record_type

  alias {
    name                   = data.terraform_remote_state.alb.outputs.alb_dns_name
    zone_id                = "Z35SXDOTRQ7X7K"  # ALB hosted zone ID (from your tfstate: alb.zone_id)
    //zone_id                = data.terraform_remote_state.alb.outputs.alb_zone_id
    evaluate_target_health = true
  }
}
