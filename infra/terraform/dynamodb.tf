resource "aws_dynamodb_table" "api_table" {
    name = var.dynamodb_table_name
    hash_key = "id"
    billing_mode = "PAY_PER_REQUEST"
    read_capacity = 5
    write_capacity = 5

    attribute {
        name = "id"
        type = "S"
    }
}