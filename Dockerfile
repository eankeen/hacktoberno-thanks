FROM ubuntu:18.10

RUN apt-get update \
	&& apt-get install --no-install-recommends -y jq ca-certificates

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
