FROM hypriot/rpi-golang

RUN mkdir -p /gopath/src/app
WORKDIR /gopath/src/app
RUN apt-get update && apt-get install -y curl && apt-get clean
RUN curl -L -o /usr/local/bin/go-wrapper https://github.com/docker-library/golang/raw/master/go-wrapper && chmod 755 /usr/local/bin/go-wrapper
# this will ideally be built by the ONBUILD below ;)
CMD ["go-wrapper", "run"]

ONBUILD COPY . /gopath/src/app
ONBUILD RUN go-wrapper download
ONBUILD RUN go-wrapper install
