import json
import logging
import os
from elasticsearch import Elasticsearch

logging.basicConfig()
logger = logging.getLogger('elasticsearch_indexer_lambda')
logger.setLevel(logging.DEBUG)

def handler(event, context):
    logger.debug('event: %s', json.dumps(event))
    es = Elasticsearch(os.environ['ES_HOST'])
    esInfo = es.info()
    logger.debug('esInfo: %s', json.dumps(esInfo))
