output "public_rt_id" {
  value = aws_route_table.public.id
}

output "private_rt_id" {
  value = aws_route_table.private.id
}

output "igw_id" {
  value = data.terraform_remote_state.igw.outputs[var.igw_output_name]
}
