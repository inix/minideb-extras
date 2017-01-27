[![CircleCI](https://circleci.com/gh/bitnami/stacksmith-base/tree/master.svg?style=shield)](https://circleci.com/gh/bitnami/stacksmith-base/tree/master)

# Stacksmith Base Docker image

## TL;DR;

```dockerfile
FROM gcr.io/stacksmith-images/minideb:latest
```

## About

Stacksmith Base Docker image is a customized base image for use in Bitnami container offerings and is built on top of the light weight and Debian-based `bitnami/minideb` image. Learn more about [bitnami/minideb](https://github.com/bitnami/minideb) in the [Bitnami engineering blog](https://engineering.bitnami.com) post titled [Minideb: A New Container Base Image](https://engineering.bitnami.com/2016/11/02/minideb-a-new-container-base-image.html).

The `Dockerfile` installs [Nami](https://github.com/bitnami/nami) and includes a `bitnami-pkg` helper script to simplify downloading of Nami modules from the Bitnami package repositories. Additionally the `Dockerfile` installs [tini](https://github.com/krallin/tini)  and is used in the default [entrypoint](../../blob/master/rootfs/entrypoint.sh).

## Variants

The image is available in two variants:

|                   Image                    |        Description         |
|--------------------------------------------|----------------------------|
| gcr.io/stacksmith-images/minideb           | Basic configuration        |
| gcr.io/stacksmith-images/minideb-buildpack | Includes a build toolchain |

## Configuration Parameters

The following tables lists the configurable parameters of the image.

|         Parameter         |                                                Description                                                 |
|---------------------------|------------------------------------------------------------------------------------------------------------|
| `DEBUG`                   | [Turn on debugging](#enabling-debugging)                                                                   |
| `DISABLE_WELCOME_MESSAGE` | [Turn off the welcome text](#turning-off-the-welcome-text)                                                 |
| `DISABLE_LAUNCH_TRACKING` | [Turn off update notifications and launch tracking](#turning-off-update-notifications-and-launch-tracking) |

### Enabling debugging

To enable debugging add `DEBUG=1` to the container environment. The `DEBUG` variable enables helpful logging and debugging features which can be valuable for debugging issues.

### Turning off the welcome text

When a new container is launched, the entrypoint will display a welcome message as illustrated below:

```console
 *** Welcome to the apache image ***
 *** Brought to you by Bitnami ***
 *** More information: https://github.com/bitnami/bitnami-docker-apache ***
 *** Issues: https://github.com/bitnami/bitnami-docker-apache/issues ***
```

Adding `DISABLE_WELCOME_MESSAGE=1` to the container environment turns off this message.

### Turning off update notifications and launch tracking

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

__Copyright (c) 2015-2017 Bitnami__

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
