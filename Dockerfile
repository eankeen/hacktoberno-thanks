# FROM ubuntu:18.10
# FROM ubuntu:20.10
FROM alpine/git:latest

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
