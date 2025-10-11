resource "docker_image" "nginx" {
  name         = "nginx:stable-alpine3.21-perl"
  keep_locally = false
}

resource "docker_container" "nginx" {
  for_each = var.nginx_containers

  name  = "nginx-${terraform.workspace}-${each.key}"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 80
    external = each.value
  }
}
