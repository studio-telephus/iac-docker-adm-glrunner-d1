module "container_glrunner_d2" {
  source    = "github.com/studio-telephus/terraform-lxd-instance.git?ref=main"
  name      = "container-glrunner-d2"
  image     = "images:debian/bookworm"
  profiles  = ["limits", "fs-dir", "nw-adm", "privileged"]
  autostart = false
  nic = {
    name = "eth0"
    properties = {
      nictype        = "bridged"
      parent         = "adm-network"
      "ipv4.address" = "10.0.10.132"
    }
  }
  mount_dirs = [
    "${path.cwd}/filesystem-shared-ca-certificates",
    "${path.cwd}/filesystem",
  ]
  exec_enabled = true
  exec = [{
    entrypoint = "/mnt/install.sh"
    environment = {
      RANDOM_STRING                  = "b016a2c3-416f-41db-b868-de14fea83b4e"
      GITLAB_RUNNER_REGISTRATION_KEY = var.gitlab_runner_registration_key
      DOCKER_REMOTE_ORIGIN           = var.docker_remote_origin
      DOCKER_REMOTE_SA_USERNAME      = var.docker_remote_sa_username
      DOCKER_REMOTE_SA_TOKEN         = var.docker_remote_sa_token
    }
  }]
}
