resource "docker_image" "nginx" {
  name = var.nginx_image
}

resource "docker_container" "app1" {
  name  = "app1"
  image = docker_image.nginx.name

  ports {
    internal = 80
    external = 8080
  }
volumes {
  host_path      = abspath("${path.module}/files/web")
  container_path = "/usr/share/nginx/html"
}
  networks_advanced {
    name = docker_network.app_net.name
  }
}

resource "docker_container" "app2" {
  name  = "app2"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 8081
  }
volumes {
  host_path      = abspath("${path.module}/files/web")
  container_path = "/usr/share/nginx/html"
}
  networks_advanced {
    name = docker_network.app_net.name
  }
}

resource "docker_container" "app3" {
  name  = "app3"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 8082
  }
volumes {
  host_path      = abspath("${path.module}/files/web")
  container_path = "/usr/share/nginx/html"
}
  networks_advanced {
    name = docker_network.app_net.name
  }
}
