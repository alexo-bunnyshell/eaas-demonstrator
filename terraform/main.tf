provider "aws" {
}



resource "aws_s3_bucket" "the_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
  }
}


resource "aws_s3_bucket_ownership_controls" "the_bucket_ownership" {
  bucket = aws_s3_bucket.the_bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "the_bucket_public_access" {
  bucket = aws_s3_bucket.the_bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "the_bucket_acl" {
  bucket = aws_s3_bucket.the_bucket.bucket
  acl    = "public-read"

  depends_on = [
    aws_s3_bucket_ownership_controls.the_bucket_ownership,
    aws_s3_bucket_public_access_block.the_bucket_public_access,
  ]
}

resource "aws_s3_bucket_cors_configuration" "the_bucket_cors" {
  bucket = aws_s3_bucket.the_bucket.bucket

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  depends_on = [aws_s3_bucket.the_bucket]

}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.the_bucket.bucket
  key    = "index.html"
  content = var.index_html_content
  acl =  "public-read"
  content_type = "text/html"

}