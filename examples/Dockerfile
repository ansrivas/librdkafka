FROM ansrivas/librdkafka:latest

RUN apk --update add --virtual build-dependencies gcc bash python-dev build-base git \
    && apk add --update --no-cache python py-pip \
    && pip install -U pykafka \
    && apk del build-dependencies

WORKDIR /root

ADD main.py /root

CMD python /root/main.py
