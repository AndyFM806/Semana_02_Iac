variable "nginx_image" {
  type    = string
  default = "nginx:stable-alpine3.21-perl"
}

variable "redis_image" {
  type    = string
  default = "redis:7.4.1-alpine"
}

variable "postgres_image" {
  type    = string
  default = "postgres:15-alpine"
}

variable "grafana_image" {
  type    = string
  default = "grafana/grafana-enterprise:9.4.7"
}
variable "redis_external_port" {
  description = "Puerto externo de Redis según el entorno (dev, qa, prod)"
  type        = map(number)
  default = {
    dev  = 6380
    qa   = 6385
    prod = 6381
  }
}

variable "nginx_containers" {
  description = "Lista de contenedores NGINX con su puerto externo"
  type        = map(number)
  default = {
    app1 = 8080
    app2 = 8081
    app3 = 8082
  }
}

variable "postgres_external_port" {
  description = "Puerto externo de PostgreSQL"
  type        = number
  default     = 5432
}

variable "postgres_user" {
  description = "Usuario para la base de datos PostgreSQL"
  type        = string
  default     = "admin"
}

variable "postgres_password" {
  description = "Contraseña para la base de datos PostgreSQL"
  type        = string
  default     = "admin123"
  sensitive   = true
}

variable "postgres_db" {
  description = "Nombre de la base de datos principal"
  type        = string
  default     = "app_db"
}
variable "grafana_external_port" {
  description = "Puerto externo de Grafana"
  type        = number
  default     = 3000
}
variable "firewall_image" {
  description = "Imagen del contenedor firewall"
  type        = string
}

variable "firewall_tag" {
  description = "Versión de la imagen del contenedor firewall"
  type        = string
}
