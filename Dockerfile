FROM debian:stable-slim

RUN apt update && apt install sudo wget zip build-essential zlib1g-dev smartmontools util-linux -y

RUN wget https://github.com/amadvance/snapraid/releases/download/v14.1/snapraid-14.1.tar.gz && \
    tar xf snapraid-14.1.tar.gz
RUN cd snapraid-14.1 && \
    ./configure && \
    make && sudo make install && \
    cp snapraid.conf.example /etc/snapraid.conf

RUN wget https://github.com/amadvance/snapraid-daemon/releases/download/v1.5/snapraid-daemon-1.5.tar.gz && \
    tar xf snapraid-daemon-1.5.tar.gz
RUN cd snapraid-daemon-1.5 && \
    ./configure && \
    make && sudo make install

EXPOSE 7627

CMD ["snapraidd", "-f"]