[![CircleCI](https://circleci.com/gh/bitnami/stacksmith-base/tree/master.svg?style=shield)](https://circleci.com/gh/bitnami/stacksmith-base/tree/master)

# Stacksmith Base Docker image

## TL;DR

```dockerfile
FROM gcr.io/stacksmith-images/minideb:jessie
```

## About

The Stacksmith Base Docker image is a customized base image for use in Bitnami container images and is built on top of the light-weight and Debian-based `bitnami/minideb` image. Learn more about [bitnami/minideb](https://github.com/bitnami/minideb) in [Minideb: A New Container Base Image](https://engineering.bitnami.com/2016/11/02/minideb-a-new-container-base-image.html).

The `Dockerfile` installs [Nami](https://github.com/bitnami/nami) and includes a `bitnami-pkg` helper script to simplify downloading of Nami modules from the Bitnami package repositories. Additionally the `Dockerfile` installs [tini](https://github.com/krallin/tini)  and is used in the default [entrypoint](../../blob/master/rootfs/entrypoint.sh).

## Variants

The image is available in two variants:

|                       Image                       |                    Configuration                    |
|---------------------------------------------------|-----------------------------------------------------|
| gcr.io/stacksmith-images/minideb:jessie           | Standard                                            |
| gcr.io/stacksmith-images/minideb-buildpack:jessie | Buildpack (includes `build-essential`, `git`, etc.) |

## Usage

Use like a regular base image.

The following example uses the `install_packages` helper script, provided by `minideb`, to install APT packages from the Debian repositories. The `bitnami-pkg` tool to install `nami` packages published by Bitnami.

```dockerfile
FROM gcr.io/stacksmith-images/minideb:jessie
ENV BITNAMI_APP_NAME=apache
RUN install_packages libssl1.0.0 libaprutil1 libapr1 libc6 libuuid1 libexpat1 \
      libpcre3 libldap-2.4-2 libsasl2-2 libgnutls-deb0-28 zlib1g libp11-kit0 \
      libtasn1-6 libnettle4 libhogweed2 libgmp10 libffi6
RUN bitnami-pkg install apache-2.4.25-0
CMD ["nami", "start", "--foreground", "apache"]
```

## Configuration Parameters

The following tables lists the configurable parameters of the image.

|         Parameter         |                                               Description                                               |
|---------------------------|---------------------------------------------------------------------------------------------------------|
| `NAMI_DEBUG`              | [Turn on debugging](#turn-on-debugging)                                                                 |
| `DISABLE_WELCOME_MESSAGE` | [Turn off the welcome text](#turn-off-the-welcome-text)                                                 |
| `DISABLE_LAUNCH_TRACKING` | [Turn off update notifications and launch tracking](#turn-off-update-notifications-and-launch-tracking) |

### Turn on debugging

To enable debugging add `NAMI_DEBUG=1` to the container environment. The `NAMI_DEBUG` variable enables helpful logging and debugging features which can be valuable for debugging issues.

### Turn off the welcome text

When a new container is launched, a welcome message is displayed as illustrated below:

```console
 *** Welcome to the apache image ***
 *** Brought to you by Bitnami ***
 *** More information: https://github.com/bitnami/bitnami-docker-apache ***
 *** Issues: https://github.com/bitnami/bitnami-docker-apache/issues ***
```

Adding `DISABLE_WELCOME_MESSAGE=1` to the container environment turns off this message.

### Turn off update notifications and launch tracking

Like all Bitnami offerings, our container images are kept up-to-date and secure and we want users to be notified when new updates are available.

When a container is launched, it contacts the Bitnami update notification service to check for updates. Bitnami tracks container launch data while performing this check. This helps us understand which apps are popular and prioritize app development.

The launch data collected includes:

  - Image version in use
  - Registry (Dockerhub, etc.)
  - Platform (Kubernetes, etc.)
  - Cloud (GCE, AWS, etc.)

Update notifications and launch tracking are enabled by default. You can turn these off by adding `DISABLE_LAUNCH_TRACKING=1` to the container environment.

## Contributing

We'd love for you to contribute to this container. You can request new features by creating an [issue](../../issues/new) or submitting a [pull request](../../issues/pull) with your contribution.

### Issues

If you encountered a problem running this container, you can file an [issue](../../issues/new). Be sure to include the following information in your issue:

- Host OS and version
- Output of:
  + `docker version`
  + `docker info`
- Steps to reproduce the issue
- Logging information with debug mode enabled

## License

Copyright 2015 - 2017 Bitnami

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
