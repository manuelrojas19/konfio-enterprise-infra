# Create a Route 53 zone id
resource "aws_route53_zone" "main" {
  name = var.zone_name
  vpc {
    vpc_id = module.vpc.vpc_id
  }
}

# Create a Route 53 alias record for the RDS instance
resource "aws_route53_record" "rds_cname" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.rds_record_name
  type    = "CNAME"
  ttl     = 60
  records = [split(":", module.rds.db_instance_endpoint)[0]]
}