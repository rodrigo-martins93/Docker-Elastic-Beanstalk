resource "aws_elastic_beanstalk_application" "beanstalk_aplication" {
    name        = var.repository_name
    description = var.description
}

resource "aws_elastic_beanstalk_environment" "beanstalk_aplication_environment" {
    name                = var.environment
    application         = aws_elastic_beanstalk_application.beanstalk_aplication.name
    solution_stack_name = "64bit Amazon Linux 2023 v4.4.3 running Docker"

setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
    }

setting {
namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_size
    }

setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
    }

}

resource "aws_elastic_beanstalk_application_version" "beanstalk_aplication_version" {
    depends_on =  [aws_elastic_beanstalk_environment.beanstalk_aplication_environment,
    aws_elastic_beanstalk_application.beanstalk_aplication,
    aws_s3_object.docker
    ]
    name        = var.environment
    application = var.repository_name
    description = var.description
    bucket      = aws_s3_bucket.beansatalk_deployments.id
    key         = aws_s3_object.docker.id
}




