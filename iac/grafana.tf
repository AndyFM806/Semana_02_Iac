resource "docker_image" "grafana" {
  name         = var.grafana_image
  keep_locally = false
}

resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.name
  ports {
    internal = 3000
    external = var.grafana_external_port
  }
  env = [
    "GF_SECURITY_ADMIN_USER=admin",
    "GF_SECURITY_ADMIN_PASSWORD=admin"
  ]
  networks_advanced {
    name = docker_network.public_net.name

  }
}
