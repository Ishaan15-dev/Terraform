variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}

variable "project" {
  description = "Project name for resource naming"
  type        = string
}

variable "index_file_path" {
  description = "Local path of index.html file"
  type        = string
}
