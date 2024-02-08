resource "aws_s3_bucket" "gagan" {
  for_each = toset(var.bucket)
  bucket = each.key
}