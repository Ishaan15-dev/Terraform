data "aws_ami" "salary_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["dev-Salary"]
  }
  owners = ["self"]
}
