FROM sebp/elk
ENV SHELL /bin/bash
COPY ./20-wiki-abstract-xml.conf /etc/logstash/conf.d/20-wiki-abstract-xml.conf
COPY ./30-output.conf /etc/logstash/conf.d/30-output.conf
RUN mkdir p /opt/wiki-data
COPY ./enwiki-latest-abstract.xml /opt/wiki-data/enwiki-latest-abstract.xml
