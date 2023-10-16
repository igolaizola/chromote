FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0

RUN apt-get update && \
    apt-get install -y \
      --no-install-recommends \
      net-tools \
      socat \
      novnc \
      supervisor \
      x11vnc \
      xvfb \
      wget \
      fonts-droid-fallback && \
    ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html && \
    wget --no-check-certificate https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb && \
    apt-get install --no-install-recommends -f -y /tmp/google-chrome-stable_current_amd64.deb && \
    rm /tmp/google-chrome-stable_current_amd64.deb

EXPOSE 8080 9222

COPY supervisord.conf /supervisord.conf
COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
