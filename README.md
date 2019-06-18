# sqs-lambda-elasticsearch

Example repository demonstrating how to load data into an AWS ElasticSearch cluster,
using SQS and Lambda.

## Quick start

### 1. Create the infrastructure

```bash

docker-compose run terraform-runner apply

```

### 2. Send a message to the queue

```bash

aws sqs send-message --queue-url $QUEUE_URL --message-body "Howdy, world"

```

### 3. Check the logs

```bash

aws logs filter-log-events --log-group-name '/aws/lambda/elasticsearch_indexer_lambda'

```
