output "s3_bucket_id" {
  value = aws_s3_bucket.prod_cv.id
}

output "s3_bucket_domain_name" {    
  value = aws_s3_bucket.prod_cv.bucket_domain_name
}