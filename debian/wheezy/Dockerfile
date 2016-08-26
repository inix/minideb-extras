FROM debian@sha256:1e21d6ccae906c032fb20c9d5a8d834d6673b6f760aefcf41315a253f87d9c2b
MAINTAINER Bitnami <containers@bitnami.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y curl ca-certificates sudo procps libaio1 && \
  useradd -ms /bin/bash bitnami && \
  mkdir -p /opt/bitnami && chown bitnami:bitnami /opt/bitnami && \
  sed -i -e 's/\s*Defaults\s*secure_path\s*=/# Defaults secure_path=/' /etc/sudoers && \
  echo "bitnami ALL=NOPASSWD: ALL" >> /etc/sudoers && \
  apt-get clean && \
  rm -rf /var/lib/apt /var/cache/apt/archives/* /tmp/*

ENV NAMI_VERSION 0.0.3-0

RUN cd /tmp && \
  curl -sSLO https://nami-prod.s3.amazonaws.com/tools/nami/releases/nami-$NAMI_VERSION-linux-x64.tar.gz && \
  echo "34c186f7fcd04a5f54c409b334e945c60cf863ddd65f6a584ebc4e385fbb5283  nami-$NAMI_VERSION-linux-x64.tar.gz" | sha256sum -c - && \
  mkdir -p /opt/bitnami/nami && \
  tar xzf nami-$NAMI_VERSION-linux-x64.tar.gz --strip 1 -C /opt/bitnami/nami && \
  rm nami-$NAMI_VERSION-linux-x64.tar.gz

ENV TINI_VERSION v0.9.0

RUN cd /tmp && \
  curl -sSLO https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini && \
  curl -sSLO https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini.asc && \
  gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 && \
  gpg --verify tini.asc && \
  chmod +x tini && \
  mv tini /usr/local/bin/ && \
  rm tini.asc

ENV PATH=/opt/bitnami/nami/bin:$PATH

COPY rootfs /
ENTRYPOINT ["/entrypoint.sh"]
