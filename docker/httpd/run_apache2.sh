#docker run --rm httpd:2.4 cqt /usr/local/apache2/conf/httpd.conf > httpd.apache2.conf
docker run --rm -d -it --name apache8089 -p 8089:80 httpd