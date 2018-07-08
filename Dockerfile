FROM debian:stretch

COPY . /brubeck
WORKDIR /brubeck

RUN apt-get update && apt-get install -y \
    libjansson-dev \
    libmicrohttpd-dev \
    libssl-dev \
    git \
    make \
    gcc \
  && ./script/bootstrap \
  && install brubeck /usr/local/bin \
  && rm -rf /brubeck/* \
  && apt-get remove -y \
    libjansson-dev \
    libmicrohttpd-dev \
    libssl-dev \
    git \
    make \
    gcc \
  && rm -rf /var/lib/apt/lists/*

ADD config.default.json.example /brubeck/config.default.json

ENTRYPOINT ["/usr/local/bin/brubeck"]
