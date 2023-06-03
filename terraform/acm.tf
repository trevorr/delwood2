resource "aws_acm_certificate" "delwood2" {
  domain_name               = "delwood2.com"
  validation_method         = "DNS"
  subject_alternative_names = ["*.delwood2.com"]

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      validation_method
    ]
  }
}
