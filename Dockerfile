# this file describes how to build tsuru glassfish41 image
# to run it:
# 1- run: $ tsuru-admin platform-add glassfish41 -d https://raw.githubusercontent.com/mwduarte/glassfish41/master/Dockerfile

from    ubuntu:14.04
run     apt-get update
run     apt-get install wget -y --force-yes
run     apt-get install unzip -y --force-yes
run     wget http://github.com/tsuru/basebuilder/tarball/master -O basebuilder.tar.gz --no-check-certificate
run     wget https://github.com/mwduarte/glassfish41/archive/master.zip -O /tmp/glassfish41.zip --no-check-certificate
run     mkdir /var/lib/tsuru
run     tar -xvf basebuilder.tar.gz -C /var/lib/tsuru --strip 1
run     cd /var/lib/tsuru && unzip /tmp/glassfish41.zip && mv glassfish41-master glassfish41 && chown ubuntu:ubuntu glassfish41 && -f /tmp/glassfish41.zip
run     cp /var/lib/tsuru/glassfish41/deploy /var/lib/tsuru
run     cp /var/lib/tsuru/glassfish41/start /var/lib/tsuru
run     cd /
run     /var/lib/tsuru/glassfish41/install
