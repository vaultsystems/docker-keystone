FROM ubuntu:trusty
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y ubuntu-cloud-keyring && \
    echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu trusty-updates/kilo main" > /etc/apt/sources.list.d/cloudarchive-kilo.list && \
    apt-get update && \
    apt-get install -y keystone python-mysqldb ubuntu-cloud-keyring && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY keystone.conf /etc/keystone/keystone.conf

EXPOSE 5000 35357
CMD sed -i.bak 's/mysql_host/'"$mysql_host"'/' /etc/keystone/keystone.conf && sed -i.bak 's/mysql_pwd/'"$mysql_pwd"'/' /etc/keystone/keystone.conf  && sed -i.bak 's/adm_token/'"$adm_token"'/' /etc/keystone/keystone.conf && sed -i.bak 's,pub_ep,'"$pub_ep"',' /etc/keystone/keystone.conf && /usr/bin/keystone-all
