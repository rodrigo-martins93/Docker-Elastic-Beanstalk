module "homolog" {
    source = "../../infra"
    
    repository_name = "homolog-repository"
    description = "This is the homolog environment"
    environment = "homolog"
    instance_type = "t2.micro"
    max_size = 3
}
