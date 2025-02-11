resource "aws_s3_bucket" "beansatalk_deployments" {
    bucket = "${var.repository_name}-deployments"
}


resource "aws_s3_object" "docker" {
    depends_on = [aws_s3_bucket.beansatalk_deployments]
    bucket = "${var.repository_name}-deployments"
    key    = "${var.repository_name}.zip"
    source = "${var.repository_name}.zip"

    # The filemd5() function is available in Terraform 0.11.12 and later
    # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
    # etag = "${md5(file("path/to/file"))}"
    etag = filemd5("${var.repository_name}.zip")
}
