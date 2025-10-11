resource "docker_image" "postgres" {
  name = var.postgres_image
}

resource "docker_volume" "pgdata" {
  name = "pgdata"
}

resource "docker_container" "postgres" {
  name  = "postgres"
  image = docker_image.postgres.latest
  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]
  ports {
    internal = 5432
    external = var.postgres_external_port
  }
  volumes = ["${docker_volume.pgdata.name}:/var/lib/postgresql/data"]
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}
