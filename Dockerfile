FROM debian:stretch
MAINTAINER Maximilian Ehlers <github-oss@ehlers.berlin>

RUN apt-get update && \
    apt-get install -y --no-install-recommends streamripper

RUN useradd -m -d /home/streamripper streamripper
USER streamripper
WORKDIR /home/streamripper

# expose relay port
EXPOSE 8000

ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]
VOLUME /home/streamripper
