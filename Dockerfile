FROM n8nio/n8n:latest

USER root

RUN npm install -g mailparser imap-simple heic-convert fs

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
