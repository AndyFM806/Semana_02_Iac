resource "docker_image" "nginx" {
  name = var.nginx_image
}

resource "docker_container" "app1" {
  name  = "app1"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8080
  }
  networks_advanced {
    name = docker_network.app_net.name
  }
}

resource "docker_container" "app2" {
  name  = "app2"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8081
  }
  networks_advanced {
    name = docker_network.app_net.name
  }
}

resource "docker_container" "app3" {
  name  = "app3"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8082
  }
  networks_advanced {
    name = docker_network.app_net.name
  }
}
