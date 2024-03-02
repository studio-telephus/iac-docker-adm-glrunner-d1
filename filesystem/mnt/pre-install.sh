#!/usr/bin/env bash

echo "Pre-install system tools"

apk add --update --no-cache \
		bash curl ca-certificates git openssl wget openssh vim net-tools bash-completion htop
