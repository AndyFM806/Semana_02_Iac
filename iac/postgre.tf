resource "docker_image" "postgres" {
  name = var.postgres_image
  keep_locally = false
}
resource "docker_volume" "pgdata" {
  name = "pgdata"
}

resource "docker_container" "postgres" {
  name  = "postgres"
  image = docker_image.postgres.name

  ports {
    internal = 5432
    external = var.postgres_external_port
  }

  mounts {
    target = "/var/lib/postgresql/data"
    source = docker_volume.pgdata.name
    type   = "volume"
  }

  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=admin",
    "POSTGRES_DB=mydb"
  ]

  networks_advanced {
    name = docker_network.private_net.name
  }
}