resource "docker_image" "redis" {
  name = var.redis_image
}

resource "docker_volume" "redis_data" {
  name = "redis_data"
}

resource "docker_container" "redis" {
  name  = "redis"
  image = docker_image.redis.latest
  ports {
    internal = 6379
    external = var.redis_external_port
  }
  volumes = ["${docker_volume.redis_data.name}:/data"]
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}

