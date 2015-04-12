FROM voxxit/alpine-rpi
MAINTAINER Matt Williams <matt@matthewkwilliams.com>
RUN apk update \
    && apk add wget perl gzip \
    && wget http://cactus.nci.nih.gov/SDF_toolkit/SDF_toolkit.1.2.tgz \
    && tar xzvf SDF_toolkit.1.2.tgz \
    && rm SDF_toolkit.1.2.tgz \
    && cp /root/SDF_toolkit/*.pm /usr/local/lib/perl5/site_perl
VOLUME ["/data"]
ENV SHELL /bin/ash
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/SDF_toolkit

