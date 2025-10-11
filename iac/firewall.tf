resource "docker_image" "firewall" {
  name = "${var.firewall_image}:${var.firewall_tag}"
}

resource "docker_container" "firewall" {
  name        = "firewall"
  image       = docker_image.firewall.name
  privileged  = true
  
  command = [
    "bash", "-c", <<-EOT
      sysctl -w net.ipv4.ip_forward=1
      iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
      iptables -A FORWARD -i eth1 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
      iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
      echo "Firewall inicializado correctamente. Esperando..."
      while true; do sleep 3600; done
    EOT
  ]

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
