resource "docker_image" "postgres" {
  name         = "postgres:15-alpine"
  keep_locally = false
}

resource "docker_container" "postgres" {
  name  = "postgres-${terraform.workspace}"
  image = docker_image.postgres.image_id

  networks_advanced {
    name = docker_network.persistence_net.name
  }

  ports {
    internal = 5432
    external = var.postgres_external_port
  }

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  restart = "always"
}
