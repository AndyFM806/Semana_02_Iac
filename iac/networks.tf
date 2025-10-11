
# Redpublica
resource "docker_network" "public_net" {
  name = "public_net"
  driver = "bridge"
}

# RedPrivada
resource "docker_network" "private_net" {
  name = "private_net"
  internal = true
}