FROM alpine:3.6

RUN apk add --update --no-cache python py-pip

WORKDIR /root

ENV LIBRDKAFKA=v0.9.5

RUN apk --update add --virtual build-dependencies gcc bash python-dev build-base git \
  && git clone https://github.com/edenhill/librdkafka.git \
  && git checkout ${LIBRDKAFKA} \
  && cd /root/librdkafka \
  && /root/librdkafka/configure \
  && make \
  && make install \
  && apk del build-dependencies \
  && rm -rf /root/librdkafka
