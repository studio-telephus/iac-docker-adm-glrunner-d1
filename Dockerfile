FROM docker:25.0.3-dind

COPY ./filesystem /.
COPY ./filesystem-shared-ca-certificates /.

RUN bash /mnt/pre-install.sh
RUN bash /mnt/import-ca-apk.sh

RUN apk add --no-cache gitlab-runner

#
