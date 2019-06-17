resource "aws_elasticsearch_domain" "sqs_lambda_elasticsearch" {
  domain_name           = "sqs-lambda-elasticsearch"
  cluster_config {
    instance_type = "t2.micro.elasticsearch"
  }
  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }
}
