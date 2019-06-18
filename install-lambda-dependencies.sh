#!/usr/bin/env bash
docker run --rm -v "$PWD/elasticsearch-indexer-lambda":/var/task lambci/lambda:build-python3.7 pip install -t /var/task -r requirements.txt
