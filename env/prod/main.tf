module "prod" {
    source = "../../infra"
    
    repository_name = "prod-repository"
    description = "This is the prod environment"
    environment = "prod"
    instance_type = "t2.micro"
    max_size = 5
}
