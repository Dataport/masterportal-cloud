# Masterportal-Cloud

This repository provides a Dockerfile for the [Masterportal](https://masterportal.org).

## Building the docker image from source
To build the docker image from source, you need to clone this repository and run `docker build`:

```bash
git clone --recurse-submodules https://github.com/Dataport/masterportal-cloud
cd masterportal-cloud
docker build -t masterportal .
```

A portal is not provided with the container.
It needs to be mounted as a volume inside `/srv/www` (see below).

The web server is exposed at port 80 in the container.

## Using docker compose
`docker compose` allows to pre-configure the environment of the docker container.
This repository provides an example configuration that loads the demo portal from the `portal` folder and exposes the Masterportal at port 8080 on your machine.

Usage:
```
docker compose build
docker compose up -d
```

## Future plans

- Provide a Helm chart for Kubernetes deployments
