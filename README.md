# iac-docker-adm-glrunner-d1

### Helpers

Verify that Docker Engine is installed correctly by running the hello-world image

    docker run --privileged hello-world

Test login

    docker login \
      --username nx-docker-private-publish \
      --password changeit \
      nexus.adm.acme.corp:18443

## Links

- https://medium.com/@tonywooster/docker-in-docker-in-gitlab-runners-220caeb708ca
