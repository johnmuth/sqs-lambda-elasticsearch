#!/usr/bin/env bash

docker-compose run elasticsearch-indexer-lambda elasticsearch_indexer_lambda.handler '{"Records":[{"messageAttributes":{"doc":"{\"foo\":\"bar\"}"}}]}'
