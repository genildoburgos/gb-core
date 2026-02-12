variable "aws_region" {
    description = "A região da AWS (baixo custo) onde os recursos serão criados"
    type = string
    default = "us-east-2"
}

variable "bucket_name" {
    description = "Nome do bucket para armaznar imagens da api gb-core"
    type = string
    default = "gb-core-imagens"
}

variable "table_users" {
    description = "Nome da tabela de usuarios para autenticação da api gb-core"
    type = string
    default = "Users"
}

variable "table_images" {
    description = "Nome da tabela de imagens para controle de imagens da api gb-core" 
    type = string
    default = "Images"
}

