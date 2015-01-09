FROM debian
MAINTAINER Christian Lück <christian@lueck.tv>

RUN apt-get update && apt-get install -y git php5-cli && rm -rf /var/lib/apt/lists/*
ADD https://download.sculpin.io/sculpin.phar /usr/local/bin/sculpin
RUN chmod 555 /usr/local/bin/sculpin

VOLUME /data
WORKDIR /data
EXPOSE 8000

ENTRYPOINT ["sculpin"]

