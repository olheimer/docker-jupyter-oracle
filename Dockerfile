FROM jupyter/scipy-notebook:04f7f60d34a6
MAINTAINER Oliver Heim

# Build: docker build -t juypteroracle .
# Run:   docker run -d -p 8888:8888 --name juypteroracle juypteroracle

USER root

# Depending on your version exchange 19.6 in this file with the relevant version string
# (Even if version number is longer XY.Z is enough)
ENV ORACLE_HOME /usr/lib/oracle/19.6/client64

ENV LD_LIBRARY_PATH /usr/lib/oracle/19.6/client64/lib

ADD ./rpms/ /tmp/rpms/

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install --yes \
    git wget build-essential libaio1 libaio-dev alien; \
  alien -d /tmp/rpms/*.rpm; \
  dpkg -i *.deb; \
  rm -rf /tmp/rpms/ ; \
  rm *.deb; \
  echo "/usr/lib/oracle/19.6/client64/lib" > /etc/ld.so.conf.d/oracle.conf; \
  ldconfig; \
  pip install cx_oracle;
