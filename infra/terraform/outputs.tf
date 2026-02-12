output "users_table_name"{
    value = aws_dynamodb_table.users.name
}

output "images_table_name"{
    value = aws_dynamodb_table.images.name
}

output s3_bucket_name{
    value = aws_s3_bucket.api_bucket.id
}