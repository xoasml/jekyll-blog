FROM ubuntu:latest
LABEL authors="taehoon"

ENTRYPOINT ["top", "-b"]