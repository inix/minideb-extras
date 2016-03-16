FROM google/debian:wheezy
MAINTAINER Bitnami <containers@bitnami.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y curl ca-certificates sudo procps && \
  apt-get upgrade -y && \
  useradd -ms /bin/bash bitnami && \
  mkdir -p /opt/bitnami && chown bitnami:bitnami /opt/bitnami && \
  sed -i -e 's/\s*Defaults\s*secure_path\s*=/# Defaults secure_path=/' /etc/sudoers && \
  echo "bitnami ALL=NOPASSWD: ALL" >> /etc/sudoers && \
  apt-get clean && \
  rm -rf /var/lib/apt /var/cache/apt/archives/* /tmp/*

ENV HARPOON_VERSION 1.0.0-0

RUN cd /tmp && \
  curl -sSLO http://downloads.bitnami.com/files/harpoon/harpoon-$HARPOON_VERSION-linux-x64.tar.gz && \
  echo "5b6b2cccc6060d3784af058a6a7cbe2c0a48b6fcac704a60c3b897d24ddce48c  harpoon-$HARPOON_VERSION-linux-x64.tar.gz" | sha256sum -c - && \
  mkdir -p /opt/bitnami/harpoon && \
  tar xzf harpoon-$HARPOON_VERSION-linux-x64.tar.gz --strip 1 -C /opt/bitnami/harpoon && \
  rm harpoon-$HARPOON_VERSION-linux-x64.tar.gz

ENV TINI_VERSION v0.9.0

RUN cd /tmp && \
  curl -sSLO https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini && \
  curl -sSLO https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini.asc && \
  gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0527A9B7 && \
  gpg --verify tini.asc && \
  chmod +x tini && \
  mv tini /usr/local/bin/ && \
  rm tini.asc

ENV PATH=/opt/bitnami/harpoon/bin:$PATH

COPY rootfs /
ENTRYPOINT ["/entrypoint.sh"]
