variable "aws_region" {
    description = "A região da AWS (baixo custo) onde os recursos serão criados"
    type = "string"
    default = "us-east-2"
}

variable "bucket_name" {
    description = "Nome do bucket principal para armaznar arquivos da api gb-core"
    type = "string"
    default = "gb-core-bucket-1"
}

variable "dynamodb_table_name" {
    description = "Nome da tabla principal (teste) para api-gb-core"
    type = "string"
    default = "gb-core-dynamodb-table"
}

