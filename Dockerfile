FROM alpine
MAINTAINER sean@anasta.si
EXPOSE 22
VOLUME /etc/ssh/hostkey.d

ENTRYPOINT ["/usr/local/bin/entrypoint"]

RUN apk update      \
 && apk add openssh \
 && rm -r /var/cache
RUN echo 'root:screencast' | chpasswd
COPY entrypoint /usr/local/bin/entrypoint
COPY create-users /usr/local/bin/create-users
COPY sshd_config /etc/ssh/sshd_config
COPY authorized_keys.d /etc/ssh/authorized_keys.d
