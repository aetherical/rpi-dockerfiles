FROM hypriot/rpi-golang

COPY . /gopath/src/github.com/docker/swarm
WORKDIR /gopath/src/github.com/docker/swarm

ENV GOPATH /gopath/src/github.com/docker/swarm/Godeps/_workspace:$GOPATH
RUN CGO_ENABLED=0 go install -v -a -tags netgo -ldflags "-w -X github.com/docker/swarm/version.GITCOMMIT `git rev-parse --short HEAD`"

ENV SWARM_HOST :2375
EXPOSE 2375

VOLUME $HOME/.swarm

ENTRYPOINT ["swarm"]
CMD ["--help"]
