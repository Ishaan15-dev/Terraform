variable "bucket_name" {
  description = "Globally unique S3 bucket name for static website"
  type        = string
}

variable "project" {
  description = "Project name used for resource naming"
  type        = string
}

variable "index_file_path" {
  description = "Local path of index.html to upload to S3"
  type        = string
}
