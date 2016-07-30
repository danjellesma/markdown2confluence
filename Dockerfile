FROM ruby:2.3.1-alpine
MAINTAINER Dan Jellesma

RUN mkdir /markdown

RUN apk update && \
    apk upgrade && apk add build-base \
    rm -rf /var/cache/apk/*

RUN gem install markdown2confluence --no-rdoc --no-ri

WORKDIR /markdown
COPY ./test-local.md .

ENTRYPOINT ["markdown2confluence"]

CMD ["test-local.md"]
