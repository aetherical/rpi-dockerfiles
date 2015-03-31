FROM hypriot/rpi-golang
MAINTAINER Matt Williams <matt@matthewkwilliams.com>
WORKDIR /gopath/src/github.com/hashicorp/consul
RUN apt-get update && \
    apt-get install -y mercurial zip curl && \
    apt-get clean
RUN mkdir -p /gopath/src/github.com/hashicorp && \
    git clone git://github.com/hashicorp/consul /gopath/src/github.com/hashicorp/consul && \
    cd /gopath/src/github.com/hashicorp/consul
RUN make
RUN apt-get -y remove mercurial && \
    apt-get -y autoremove
# following line from progrium/consul
ADD ./config /config/
ONBUILD ADD ./config /config/
ADD https://dl.bintray.com/mitchellh/consul/0.5.0_web_ui.zip /tmp/webui.zip
RUN mkdir /ui && cd /ui && unzip /tmp/webui.zip && rm /tmp/webui.zip && mv dist/* . && rm -rf dist

ADD ./start /bin/start
ADD ./check-http /bin/check-http
ADD ./check-cmd /bin/check-cmd

VOLUME ["/data"]
EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp
ENV SHELL /bin/bash

ENTRYPOINT ["/bin/start"]
CMD []
