FROM nginx:alpine

COPY etc /etc/

EXPOSE 80

STOPSIGNAL SIGTERM

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
CMD []
