
resource "aws_s3_bucket" "staging-scripts" {
  bucket = "${var.bucket-name}-${var.environment}-${uuid()}"
  tags = {
    Name        = "${var.bucket-name}-${uuid()}"
    Environment = var.environment
  }
  force_destroy = true
}

resource "aws_s3_object" "test" {
  for_each = fileset("./scripts/", "**")
  bucket   = aws_s3_bucket.staging-scripts.bucket
  key      = each.value
  source   = "./scripts/${each.value}"
  etag     = filemd5("./scripts/${each.value}")
}
