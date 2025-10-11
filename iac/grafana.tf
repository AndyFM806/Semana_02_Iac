resource "docker_image" "grafana" {
  name         = "grafana/grafana-enterprise:9.4.7"
  keep_locally = false
}

resource "docker_container" "grafana" {
  name  = "grafana-${terraform.workspace}"
  image = docker_image.grafana.image_id

  networks_advanced {
    name = docker_network.monitor_net.name
  }

  ports {
    internal = 3000
    external = var.grafana_external_port
  }

  restart = "always"
}
