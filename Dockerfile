FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y dovecot-core dovecot-pgsql dovecot-sieve dovecot-managesieved dovecot-imapd dovecot-pop3d dovecot-lmtpd dovecot-ldap dovecot-solr && apt-get clean

RUN sed -i -e 's,#log_path = syslog,log_path = /dev/stderr,' \
               -e 's,#info_log_path =,info_log_path = /dev/stdout,' \
               -e 's,#debug_log_path =,debug_log_path = /dev/stdout,' \
            /etc/dovecot/conf.d/10-logging.conf

RUN mkdir -p /var/vmail/

RUN groupadd vmail
RUN useradd vmail -g vmail  -d /var/vmail/

RUN chown -R vmail:vmail /var/vmail/

CMD ["dovecot","-F"]
