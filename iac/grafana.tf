resource "docker_image" "grafana" {
  name = var.grafana_image
}

resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.latest
  ports {
    internal = 3000
    external = 3000
  }
  networks_advanced {
    name = docker_network.monitor_net.name
  }
}
