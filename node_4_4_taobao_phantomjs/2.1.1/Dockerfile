from node:4.4

# Env
ENV PHANTOMJS_VERSION 2.1.1

# Commands
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y vim git wget libfreetype6 libfontconfig bzip2 && \
  mkdir -p /srv/var && \
  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://npm.taobao.org/mirrors/phantomjs/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /srv/var/phantomjs && \
  ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
  git clone https://github.com/n1k0/casperjs.git /srv/var/casperjs && \
  ln -s /srv/var/casperjs/bin/casperjs /usr/bin/casperjs && \
  apt-get autoremove -y && \
  apt-get clean all

USER go
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
