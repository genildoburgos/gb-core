resource "aws_dynamodb_table" "users" {
    name = var.table_users
    hash_key = "id"
    billing_mode = "PROVISIONED"
    read_capacity = 5
    write_capacity = 5

    attribute {
        name = "id"
        type = "S"
    }

    attribute {
        name = "email"
        type = "S"
    }

    global_secondary_index {
        name            = "EmailIndex"
        hash_key        = "email"
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
    }

    tags = {
        Project = "gb-core"
    }
}

resource "aws_dynamodb_table" "images" {
    name = var.table_images
    hash_key = "id"
    billing_mode = "PROVISIONED"
    read_capacity = 5
    write_capacity = 5

    attribute {
        name = "id"
        type = "S"
    }

    attribute {
        name = "userId"
        type = "S"
    }

    attribute {
        name = "createdAt"
        type = "N"
    }

    global_secondary_index {
        name            = "UserIndex"
        hash_key        = "userId"
        range_key       = "createdAt"
        write_capacity  = 5
        read_capacity   = 5
        projection_type = "ALL"
    }

    tags = {
        Project = "gb-core"
    }
}