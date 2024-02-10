

variable "bucket-name" {
  type        = string
  default     = "staging-scripts"
  description = "The S3 bucket name"
}

variable "environment" {
  type        = string
  default     = "dit"
  description = "environment for the s3."
}

