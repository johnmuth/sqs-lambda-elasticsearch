import json
import logging

logging.basicConfig()
logger = logging.getLogger('elasticsearch_indexer_lambda')
logger.setLevel(logging.DEBUG)

def handler(event, context):
    logger.debug('event: %s', json.dumps(event))
