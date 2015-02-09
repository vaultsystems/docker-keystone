	docker run -d -v /etc/keystone/ssl:/etc/keystone/ssl -e mysql_host=10.2.0.20 -e mysql_pwd="pass" -e adm_token="token" -e pub_ep="https://server:port" -p 5001:5000 keystone/latest

The public endpoint must be configured in keystone until we upgrade to Openstack Kilo:

https://bugs.launchpad.net/keystone/+bug/1370022

Kilo will provide a better solution to preserve the protocol across an SSL terminator.
