resource "aws_s3_bucket" "api_bucket"{
    bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "api_bucket_ownership" {
    bucket = aws_s3_bucket.api_bucket.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}