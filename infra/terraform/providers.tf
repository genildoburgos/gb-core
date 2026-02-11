provider "aws"{
    region = var.aws_region

    default_tags {
        tags = {
            Project = "gb-core"
            ManageBy = "Terraform"
        }
    }

}