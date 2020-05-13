FROM bxwill/python:3.8-buster-skywalking
LABEL maintainer="v.stone@163.com" \
      organization="Truth & Insurance Office"
WORKDIR /workspace
COPY . .
RUN pip install -r requirements.txt
