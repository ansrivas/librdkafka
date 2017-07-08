# !/usr/bin/env python
# -*- coding: utf-8 -*-
"""Initialize module utils."""

from pykafka import KafkaClient

client = KafkaClient(hosts="localhost:19092")
print(client.topics)
topic = client.topics[b'some_topic']

with topic.get_producer(use_rdkafka=True) as producer:
    for i in range(4):
        msg = 'test message ' + str(i ** 2)
        producer.produce(msg.encode())
