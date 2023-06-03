resource "aws_cloudfront_distribution" "delwood2" {
  origin {
    domain_name = aws_s3_bucket.delwood2.bucket_regional_domain_name
    origin_id   = "S3-delwood2"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Delwood 2 website"
  http_version        = "http2"
  default_root_object = "index.html"

  aliases = ["delwood2.com", "www.delwood2.com"]

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    target_origin_id       = "S3-delwood2"
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 300
    max_ttl                = 300

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.delwood2.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }
}
