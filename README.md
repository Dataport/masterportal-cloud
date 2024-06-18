# Masterportal-Cloud

This repository provides a Dockerfile for the [Masterportal](https://masterportal.org).

## Building the docker image from source
To build the docker image from source, you need to clone this repository and run `docker build`:

```bash
git clone --recurse-submodules https://github.com/Dataport/masterportal-cloud
cd masterportal-cloud
docker build -t masterportal .
```

## Future plans

- Provide a Helm chart for Kubernetes deployments
