### Helpers

Verify that Docker Engine is installed correctly by running the hello-world image

    docker run --privileged hello-world

Test login

    docker login \
      --username nx-docker-private-publish \
      --password changeit \
      nexus.adm.acme.corp:18443
