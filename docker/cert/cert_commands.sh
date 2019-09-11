mkdir cert
cd cert
vi ssl.cfg

openssl req -x509 -nodes -newkey rsa:4096 -keyout dev.local_key.pem -out dev.local_cert.pem -days 21600 -config ssl.cfg -sha256
openssl x509 -in dev.local_cert.pem -inform PEM -out dev.local_cert.crt