FROM ubuntu:16.04
RUN apt-get update && apt-get -y install wget gcc libz-dev libssl-dev build-essential
RUN wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.9p1.tar.gz && tar -xzf openssh-7.9p1.tar.gz
RUN cd openssh-7.9p1/ && ./configure -h && ./configure --with-md5-passwords --with-privsep-path=/var/lib/sshd/ --sysconfdir=/etc/ssh && make && make install
ADD keygen.sh /opt/keygen.sh
RUN chmod 755 /opt/keygen.sh
CMD ["/opt/keygen.sh"]