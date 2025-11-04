FROM n8nio/n8n:latest

USER root

RUN apk --no-cache add ffmpeg imagemagick-dev imagemagick

RUN npm install -g mailparser imap-simple heic-convert

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
