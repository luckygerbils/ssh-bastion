FROM alpine
MAINTAINER sean@anasta.si
EXPOSE 22
VOLUME /etc/ssh/hostkey.d
VOLUME /etc/ssh/authorized_keys.d

ENTRYPOINT ["/usr/local/bin/entrypoint"]

RUN apk update      \
 && apk add openssh \
 && rm -r /var/cache
RUN echo 'root:screencast' | chpasswd
COPY entrypoint /usr/local/bin/entrypoint
COPY sshd_config /etc/ssh/sshd_config
