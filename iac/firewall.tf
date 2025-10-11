

resource "docker_image" "firewall" {
  name = "${var.firewall_image}:${var.firewall_tag}"
}

resource "docker_container" "firewall" {
  name  = "firewall"
  image = docker_image.firewall.name
  command = ["sleep", "infinity"]

  # Conectado a ambas redes
  networks_advanced {
    name = docker_network.public_net.name
  }

  networks_advanced {
    name = docker_network.private_net.name
  }

  capabilities {
    add = ["NET_ADMIN"]
  }
}
