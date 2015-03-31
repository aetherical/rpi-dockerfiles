FROM resin/rpi-raspbian:wheezy
MAINTAINER Matt Williams <matt@matthewkwilliams.com>
RUN apt-get update && \
    apt-get install -y wget && \
    echo "deb http://packages.erlang-solutions.com/debian wheezy contrib" >> /etc/apt/sources.list && \
    wget http://packages.erlang-solutions.com/debian/erlang_solutions.asc && \
    apt-key add erlang_solutions.asc && \
    apt-get update && \
    apt-get install -y erlang && \
    apt-get clean && \
    apt-get autoremove
WORKDIR=/data
CMD ["bash"]
    
