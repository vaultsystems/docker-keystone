	docker run -d -v /etc/keystone/ssl:/etc/keystone/ssl -e mysql_host=10.2.0.20 -e mysql_pwd="pass" -e adm_token="token" -e pub_ep="https://server:port" -p 5001:5000 keystone/latest
