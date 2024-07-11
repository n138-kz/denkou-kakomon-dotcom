openssl genrsa -out /etc/ssl/server.key 2048
capass=password
common_name=localhost
openssl req -new -sha256 -key /etc/ssl/server.key -out /etc/ssl/cacert.pem -keyout /etc/ssl/cakey.pem -passout env:capass -subj "/C=JP/ST=Chiba/O=myorg/CN=${common_name}" -x509 -days 365
openssl x509 -in /etc/ssl/cacert.pem -text
