FROM debian:stable-slim

ARG SNAPRAID_CLI_VERSION=14.4
ARG SNAPRAID_DAEMON_VERSION=1.9

RUN apt update && apt install sudo wget zip build-essential zlib1g-dev smartmontools util-linux -y

RUN wget https://github.com/amadvance/snapraid/releases/download/v14.2/snapraid-${SNAPRAID_CLI_VERSION}.tar.gz && \
    tar xf ${SNAPRAID_CLI_VERSION}.tar.gz
RUN cd ${SNAPRAID_CLI_VERSION} && \
    ./configure && \
    make && sudo make install && \
    cp snapraid.conf.example /etc/snapraid.conf

RUN wget https://github.com/amadvance/snapraid-daemon/releases/download/v1.6/${SNAPRAID_DAEMON_VERSION}.tar.gz && \
    tar xf ${SNAPRAID_DAEMON_VERSION}.tar.gz
RUN cd ${SNAPRAID_DAEMON_VERSION} && \
    ./configure && \
    make && sudo make install

EXPOSE 7627

CMD ["snapraidd", "-f"]