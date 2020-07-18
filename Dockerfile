FROM debian:buster-slim

RUN apt-get update && apt-get install -y dovecot-core dovecot-pgsql dovecot-sieve dovecot-managesieved && apt-get clean

CMD ["dovecot","-F"]
