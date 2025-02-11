terraform {
    backend "s3" {
        bucket = "terraform-state-rodrigo"
        key    = "homolog/terraform.tfstate"
        region = "us-west-2"
}
}
