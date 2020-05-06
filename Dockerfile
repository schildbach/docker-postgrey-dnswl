FROM ubuntu:trusty

RUN apt-get update

RUN apt-get install -y software-properties-common \
 && add-apt-repository ppa:mail-in-a-box/ppa \
 && apt-get update \
 && apt-get install -y postgrey postfix- \
 && rm -rf /var/lib/apt/lists/*

CMD ["postgrey", "--inet", "0.0.0.0:10023", "--delay", "50", "--user", "postgrey", "--group", "postgrey"]
EXPOSE 10023/tcp
VOLUME /var/lib/postgrey
