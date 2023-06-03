resource "aws_s3_bucket" "delwood2" {
  bucket = "delwood2"

  tags = {
    Name = "www.delwood2.com"
  }
}

resource "aws_s3_bucket_public_access_block" "delwood2" {
  bucket = aws_s3_bucket.delwood2.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "delwood2" {
  bucket = aws_s3_bucket.delwood2.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
