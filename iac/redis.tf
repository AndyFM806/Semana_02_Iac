resource "docker_image" "redis" {
  name = "redis:8.2.2-alpine"
}

resource "docker_volume" "redis_data" {
  name = "redis_data"
}

resource "docker_container" "redis" {
  name  = "redis"
  image = docker_image.redis.image_id
  ports {
    internal = 3306
    external = 3307
  }
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}

