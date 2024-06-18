#
# Dockerfile for Masterportal v3
#

# Pull dependencies.
# This is separated from the build to improve caching
FROM node:20-bullseye-slim AS build-environment
ARG HTTP_PROXY
ARG HTTPS_PROXY
WORKDIR /opt/masterportal
COPY masterportal/package.json masterportal/package-lock.json ./
ENV NODE_ENVIRONMENT development
RUN npm config set proxy "${HTTP_PROXY}"
RUN npm config set https-proxy "${HTTPS_PROXY}"
RUN npm ci

# Build Masterportal.
# Only the necessary folders are copied to keep the image small
# The basic portal is used for building only; include your own config via volume
# We always use mastercode version "docker" to allow updates with no change to the portal
FROM node:20-bullseye-slim AS build
WORKDIR /opt/masterportal
COPY --from=build-environment /opt/masterportal/node_modules node_modules
COPY masterportal/package.json masterportal/package-lock.json ./
COPY masterportal/img img
COPY masterportal/js js
COPY masterportal/src_3_0_0 src_3_0_0
COPY masterportal/locales_3_0_0 locales_3_0_0
COPY masterportal/devtools devtools
COPY lib/getMastercodeVersionFolderName.js devtools/tasks/getMastercodeVersionFolderName.js
COPY masterportal/modules modules
COPY masterportal/addons addons
COPY masterportal/portal/basic portal/basic
ENV NODE_ENVIRONMENT production
RUN npm run buildPortal

# Production image (exported).
# This only needs a static webserver serving the masterportal
FROM caddy:2
COPY --from=build /opt/masterportal/dist/mastercode /srv/www/mastercode

EXPOSE 80/tcp
CMD [ "caddy", "file-server", "--root", "/srv/www" ]
