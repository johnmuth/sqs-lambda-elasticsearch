data "archive_file" "elasticsearch_indexer_lambda" {
  type        = "zip"
  source_file = "/lambda/elasticsearch_indexer_lambda.py"
  output_path = "/lambda/elasticsearch_indexer_lambda.py.zip"
}

resource "aws_lambda_function" "elasticsearch_indexer_lambda" {
  function_name = "example_lambda"
  handler = "example_lambda.handler"
  role = "${aws_iam_role.elasticsearch_indexer_lambda.arn}"
  runtime = "python3.7"

  filename = "${data.archive_file.elasticsearch_indexer_lambda.output_path}"
  source_code_hash = "${data.archive_file.elasticsearch_indexer_lambda.output_base64sha256}"

  timeout = 30
  memory_size = 128
}
