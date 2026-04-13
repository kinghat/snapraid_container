FROM debian:stable-slim

RUN apt update && apt install sudo wget zip build-essential zlib1g-dev smartmontools util-linux -y

RUN wget https://github.com/amadvance/snapraid/releases/download/v14.2/snapraid-14.2.tar.gz && \
    tar xf snapraid-14.2.tar.gz
RUN cd snapraid-14.2 && \
    ./configure && \
    make && sudo make install && \
    cp snapraid.conf.example /etc/snapraid.conf

RUN wget https://github.com/amadvance/snapraid-daemon/releases/download/v1.6/snapraid-daemon-1.6.tar.gz && \
    tar xf snapraid-daemon-1.6.tar.gz
RUN cd snapraid-daemon-1.6 && \
    ./configure && \
    make && sudo make install

EXPOSE 7627

CMD ["snapraidd", "-f"]