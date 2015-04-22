FROM zoni/ubuntu:java8-runtime
MAINTAINER Nick Groenen

ENV ELASTICSEARCH_MAJOR_VERSION 1.5

ADD bin/build*.sh /
RUN /build1.sh && rm /build*.sh

ADD bin/start.sh /
ENTRYPOINT ["/start.sh"]
