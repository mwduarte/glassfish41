# this file describes how to build tsuru glassfish41 image
# to run it:
# 1- run: $ tsuru-admin platform-add glassfish41 -d https://raw.github.com/tsuru/basebuilder/master/java/Dockerfile

from    ubuntu:14.04
run     apt-get update
run     apt-get install wget -y --force-yes
run     wget http://github.com/tsuru/basebuilder/tarball/master -O basebuilder.tar.gz --no-check-certificate
run     mkdir /var/lib/tsuru
run     tar -xvf basebuilder.tar.gz -C /var/lib/tsuru --strip 1
run     cp /var/lib/tsuru/java/deploy /var/lib/tsuru
run     cp /var/lib/tsuru/java/start /var/lib/tsuru
run     mkdir /var/lib/tsuru/glassfish41
run     cd /var/lib/tsuru/java
run     tar cvf - * | (cd ../glassfish41; tar xvf -)
run     cd /
run     cat /var/lib/tsuru/glassfish41/install | grep -v tomcat7 > /tmp/install.temp
run     mv /tmp/install.temp /var/lib/tsuru/glassfish41/install
run     chmod 700 /var/lib/tsuru/glassfish41/install
run     /var/lib/tsuru/glassfish41/install
