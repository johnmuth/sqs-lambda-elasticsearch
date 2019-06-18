
resource "aws_lambda_event_source_mapping" "event_source_mapping" {
  batch_size        = 1
  event_source_arn  = "${aws_sqs_queue.elasticsearch_index.arn}"
  enabled           = true
  function_name     = "${aws_lambda_function.elasticsearch_indexer_lambda.arn}"
}
