resource "aws_route53_record" "eks_alias" {
  zone_id = var.route53_zone_id
  name    = "eks.${var.domain}"
  type    = "A"
  alias {
    name                   = aws_lb.eks_lb.dns_name
    zone_id                = aws_lb.eks_lb.zone_id
    evaluate_target_health = true
  }
}
