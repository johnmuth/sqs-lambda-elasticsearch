# sqs-lambda-elasticsearch

This repository provides an example of how to load data into an AWS ElasticSearch cluster,
using SQS and Lambda.

## What is here?

- elasticsearch-indexer-lambda/ : AWS Lambda written in Python, adds documents to ElasticSearch
- terraform/ : configuration files for creating AWS infrastructure (ElasticSearch, SQS queue, Lambda)
- docker-compose.yml : for running and testing locally

## Run locally

### 1. install the lambda function dependencies

```
install-lambda-dependencies.sh
```

### 2. start ElasticSearch and Kibana

```
docker-compose up -d elasticsearch kibana
```

### 3. invoke the lambda function

```
./docker-invoke-lambda.sh
```

## Run in AWS

### 1. Create the AWS infrastructure

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

## Tear down

To delete all of the AWS resources:

```bash

docker-compose run terraform-runner destroy

```
