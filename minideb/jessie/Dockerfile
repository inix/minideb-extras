FROM bitnami/minideb@sha256:246fe051851f2288980add737d8159e4d2541c414497f829904c61a76ed87f15
MAINTAINER Bitnami <containers@bitnami.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y curl ca-certificates cron sudo locales procps libaio1 libssl1.0.0 netcat-traditional && \
  useradd -ms /bin/bash bitnami && \
  mkdir -p /opt/bitnami && chown bitnami:bitnami /opt/bitnami && \
  sed -i -e 's/\s*Defaults\s*secure_path\s*=/# Defaults secure_path=/' /etc/sudoers && \
  echo "bitnami ALL=NOPASSWD: ALL" >> /etc/sudoers && \
  update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX && \
  locale-gen en_US.UTF-8 && \
  DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales && \
  apt-get clean && \
  rm -rf /var/lib/apt /var/cache/apt/archives/* /tmp/*

ENV NAMI_VERSION 0.0.6-0

RUN cd /tmp && \
  curl -sSLO https://nami-prod.s3.amazonaws.com/tools/nami/releases/nami-$NAMI_VERSION-linux-x64.tar.gz && \
  echo "08c474bf7b866879cd709f7c3efaebec43cfc2eb39c974fd83c18eb19821129a  nami-$NAMI_VERSION-linux-x64.tar.gz" | sha256sum -c - && \
  mkdir -p /opt/bitnami/nami && \
  tar xzf nami-$NAMI_VERSION-linux-x64.tar.gz --strip 1 -C /opt/bitnami/nami && \
  rm nami-$NAMI_VERSION-linux-x64.tar.gz

ENV TINI_VERSION v0.13.2

RUN cd /tmp && \
  gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 && \
  gpg --fingerprint 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 | grep -q "Key fingerprint = 6380 DC42 8747 F6C3 93FE  ACA5 9A84 159D 7001 A4E5" && \
  curl -sSL https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini.asc -o tini.asc && \
  curl -sSL https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini -o /usr/local/bin/tini && \
  gpg --verify tini.asc /usr/local/bin/tini && \
  chmod +x /usr/local/bin/tini && \
  rm tini.asc

ENV PATH=/opt/bitnami/nami/bin:$PATH

COPY rootfs /
ENTRYPOINT ["/entrypoint.sh"]
