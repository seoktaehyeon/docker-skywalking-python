FROM ubuntu AS build-prepare
WORKDIR /workspace
RUN apt-get update && \
    apt-get install -y git && \
    git clone --recursive https://github.com/apache/skywalking-python.git

FROM python:3.8-buster
LABEL maintainer=v.stone@163.com \
      organization="Truth & Insurance Office" \
      github="https://github.com/apache/skywalking-python"
WORKDIR /workspace
COPY --from=build-prepare /workspace /workspace
RUN cd skywalking-python && \
    make setup install && \
    make lint && \
    make license && \
    make test && \
    python setup.py install && \
    cd /workspace && \
    rm -rf skywalking-python
