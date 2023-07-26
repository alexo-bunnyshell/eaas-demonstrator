variable "bucket_name" {
  type = string
  default = "test-ao-tf-bucket-1"
  description = "Name of the S3 bucket"
}

variable "index_html_content" {
  type = string
  default = "<html><body><h1>Hello Bunnyshell, Terraform and S3!</h1></body></html>"
  description = "content of index.html file"
}