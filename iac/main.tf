terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

#outputs para comprobar servicios
output "app1_url" {
  value = "http://localhost:8080"
}
output "app2_url" {
  value = "http://localhost:8081"
}
output "app3_url" {
  value = "http://localhost:8082"
}
output "grafana_url" {
  value = "http://localhost:3000"
}

provider "docker" {
}

# terraform init
# terraform workspace list
# terraform workspace new dev
# terraform plan
# terraform apply -y
# terraform destroy