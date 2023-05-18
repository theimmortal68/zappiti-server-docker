FROM mono:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install tini

COPY rootfs /

ENTRYPOINT ["tini", "--"]
CMD ["/source/start.sh"]
