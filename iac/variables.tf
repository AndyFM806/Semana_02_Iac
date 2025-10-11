variable "redis_external_port" {
  type        = map(number)
}

variable "nginx_containers" {
  type        = map(number)
}

variable "postgres_external_port" {
  type        = number
}

variable "postgres_user" {
  type        = string
}

variable "postgres_password" {
  type        = string
  sensitive   = true
}

variable "postgres_db" {
  type        = string
}

variable "grafana_external_port" {
  type        = number
}
