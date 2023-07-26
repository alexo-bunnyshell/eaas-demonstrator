
output "s3_bucket_name" {
  value = aws_s3_bucket.the_bucket.id
}
output "s3_bucket_region" {
  value = aws_s3_bucket.the_bucket.region
}

output "s3_bucket_endpoint" {
  value = aws_s3_bucket.the_bucket.bucket_regional_domain_name
}
