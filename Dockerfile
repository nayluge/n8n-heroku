FROM n8nio/n8n:latest

USER root

# Dépendances système pour Chromium sur Alpine
RUN apk --no-cache add \
    ffmpeg \
    imagemagick-dev \
    imagemagick \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    udev \
    xvfb

# Dire à Puppeteer d'utiliser le Chromium système plutôt que de le télécharger
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser


RUN apk --no-cache add ffmpeg imagemagick-dev imagemagick

RUN npm install -g mailparser imap-simple heic-convert

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
