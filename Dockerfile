FROM docker:25.0.3-dind

COPY ./filesystem /.
COPY ./filesystem-shared-ca-certificates /.

RUN apk add --update --no-cache \
		bash curl ca-certificates git openssl wget openssh

RUN apk add --no-cache gitlab-runner

#RUN bash /mnt/pre-install.sh
#RUN bash /mnt/setup-ca.sh
#RUN bash /mnt/install-tools.sh
