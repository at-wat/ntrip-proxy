FROM nginx:alpine

RUN apk add --no-cache gcc musl-dev git make gfortran &&\
  cd / && git clone -b experimental --depth=1 https://github.com/at-wat/RTKLIB.git &&\
  cd RTKLIB/app && make CC=gcc && make install &&\
  cd / && rm -rf /RTKLIB &&\
  apk del --no-cache gcc musl-dev git make gfortran

COPY etc /etc/

EXPOSE 6000

STOPSIGNAL SIGTERM

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
CMD []
