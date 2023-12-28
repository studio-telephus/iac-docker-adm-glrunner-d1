module "container_adm_glrunner_d2" {
  source    = "github.com/studio-telephus/terraform-lxd-instance.git?ref=1.0.1"
  name      = "container-adm-glrunner-d2"
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
  exec         = "/mnt/install.sh"
  environment = {
    RANDOM_STRING                  = "b016a2c3-416f-41db-b868-de14fea83b4e"
    GITLAB_RUNNER_REGISTRATION_KEY = var.gitlab_runner_registration_key
  }
}
