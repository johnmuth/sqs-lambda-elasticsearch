import json
import logging
import os
from elasticsearch import Elasticsearch

logging.basicConfig()
logger = logging.getLogger('elasticsearch_indexer_lambda')
logger.setLevel(logging.DEBUG)

docType = 'test-doc-type'
index = 'test-index'

def handler(event, context):
    logger.debug('event: %s', json.dumps(event))
    es = Elasticsearch(os.environ['ES_HOST'])
    for record in event['Records']:
        doc = record['messageAttributes']['doc']
        res = es.index(index=index, doc_type=docType, body=doc)
        logger.debug(res['result'])
