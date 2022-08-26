provider "aws" {
  region = var.region
}

//TODO: 
//deploy S3 with public access 
//deploy CoudFront distribution

resource "aws_s3_bucket" "prod_cv" {
  bucket_prefix = var.bucket_prefix
  acl           = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"

  }
}

resource "aws_s3_bucket_policy" "prod_cv" {
  bucket = aws_s3_bucket.prod_cv.id
  policy = <<POLICY
{    
    "Version": "2012-10-17",    
    "Statement": [        
      {            
          "Sid": "PublicReadGetObject",            
          "Effect": "Allow",            
          "Principal": "*",            
          "Action": [                
             "s3:GetObject"            
          ],            
          "Resource": [
             "arn:aws:s3:::${aws_s3_bucket.prod_cv.id}/*"            
          ]        
      }    
    ]
}
POLICY
}
