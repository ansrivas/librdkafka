FROM alpine:3.6

WORKDIR /root

ENV LIBRDKAFKA=v0.11.1

RUN apk --update add --virtual build-dependencies gcc bash python-dev build-base git \
  && git clone https://github.com/edenhill/librdkafka.git \
  && cd /root/librdkafka \
  && git checkout ${LIBRDKAFKA} \
  && /root/librdkafka/configure \
  && make \
  && make install \
  && apk del build-dependencies \
  && rm -rf /root/librdkafka
