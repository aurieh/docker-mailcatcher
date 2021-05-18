FROM docker.io/library/ruby:3.0-alpine
LABEL maintainer="me@aurieh.me"

ARG VERSION=0.7.1

RUN \
	apk add --update libffi sqlite-libs && \
	apk add build-base libffi-dev sqlite-dev -t .build && \
	gem install mailcatcher -v $VERSION && \
	apk del .build && \
	adduser -DHh /var/empty -s /sbin/nologin -u 1000 mailcatcher

USER mailcatcher
EXPOSE 1025 1080
ENTRYPOINT ["mailcatcher", "--foreground"]
CMD ["--ip", "0.0.0.0"]
