redis_external_port = {
  dev     = 6380
  qa      = 6385
  prod    = 6381
}

nginx_containers = {
  app1 = 8080
  app2 = 8081
  app3 = 8082
}

postgres_external_port = 5432
postgres_user          = "admin"
postgres_password      = "admin123"
postgres_db            = "app_db"


grafana_external_port = 3000
