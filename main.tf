locals {
  name              = "glrunner-d1"
  docker_image_name = "tel-${var.env}-${local.name}"
  container_name    = "container-${var.env}-${local.name}"
  gitlab_address    = "https://gitlab.docker.adm.acme.corp/gitlab"
}

resource "docker_image" "gitlab_runner" {
  name         = local.docker_image_name
  keep_locally = false
  build {
    context = path.module
  }
  triggers = {
    dir_sha1 = sha1(join("", [
      filesha1("${path.module}/Dockerfile")
    ]))
  }
}

resource "docker_volume" "docker_varlib" {
  name = "volume-${var.env}-${local.name}-docker-varlib"
}

resource "docker_volume" "gitlab_runner_home" {
  name = "volume-${var.env}-${local.name}-home"
}

module "container_gitlab_runner" {
  source       = "github.com/studio-telephus/terraform-docker-container.git?ref=1.0.3"
  name         = local.container_name
  image        = docker_image.gitlab_runner.image_id
  hostname     = local.container_name
  exec_enabled = true
  exec         = "/mnt/register.sh"
  privileged   = true

  environment = {
    GITLAB_ADDRESS                 = local.gitlab_address
    GITLAB_RUNNER_REGISTRATION_KEY = module.bw_gitlab_runner_registration_key.data.password
  }

  networks_advanced = [
    {
      name         = "${var.env}-docker"
      ipv4_address = "10.10.0.132"
    }
  ]

  volumes = [
    {
      volume_name    = docker_volume.gitlab_runner_home.name
      container_path = "/home/gitlab-runner"
      read_only      = false
    },
    {
      volume_name    = docker_volume.docker_varlib.name
      container_path = "/var/lib/docker"
      read_only      = false
    }
  ]
}
