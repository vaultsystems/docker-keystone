FROM ubuntu:trusty
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y keystone python-mysqldb

COPY keystone.conf /etc/keystone/keystone.conf

EXPOSE 5000 35357
CMD sed -i.bak 's/mysql_host/'"$mysql_host"'/' /etc/keystone/keystone.conf && sed -i.bak 's/mysql_pwd/'"$mysql_pwd"'/' /etc/keystone/keystone.conf  && sed -i.bak 's/adm_token/'"$adm_token"'/' /etc/keystone/keystone.conf && /usr/bin/keystone-all
