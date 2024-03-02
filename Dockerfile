FROM docker:25.0.3-dind

COPY ./filesystem /.
COPY ./filesystem-shared-ca-certificates /.

RUN sh /mnt/pre-install.sh
RUN sh /mnt/import-ca-apk.sh

RUN apk add --no-cache gitlab-runner

#
