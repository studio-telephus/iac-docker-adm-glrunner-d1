variable "gitlab_runner_registration_key" {
  type      = string
  sensitive = true
}

variable "docker_remote_origin" {
  type    = string
  default = "artifactory.adm.acme.corp:18443"
}

variable "docker_remote_sa_username" {
  type = string
}

variable "docker_remote_sa_token" {
  type      = string
  sensitive = true
}
