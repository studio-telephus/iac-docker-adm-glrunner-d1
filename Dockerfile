FROM docker:25.0.3-dind

COPY ./filesystem /.
COPY ./filesystem-shared-ca-certificates /.

RUN apk add --update --no-cache \
    		bash curl ca-certificates git openssl wget vim net-tools htop

RUN bash /mnt/import-ca-apk.sh

RUN apk add --no-cache gitlab-runner

#
