# 📘 Semana_02_IaC — Uso rápido (Imágenes, Puertos y Comandos Terraform)

Infra local con **Terraform + Docker** (Nginx, Redis, PostgreSQL, Grafana).

---

## 🖼️ Imágenes usadas

- **Nginx:** `nginx:stable-alpine3.21-perl`
- **Redis:** `redis:7.4.1-alpine`
- **PostgreSQL:** `postgres:15-alpine`
- **Grafana:** `grafana/grafana-enterprise:9.4.7`

---

## 🔌 Puertos

### Nginx (3 contenedores)
- **Interno:** `80`
- **Externos:**  
  - `app1` → `8080`  
  - `app2` → `8081`  
  - `app3` → `8082`

### Redis
- **Interno:** `6379`  
- **Externo (según workspace):**
  - `dev` → `6380`
  - `qa`  → `6385`
  - `prod`→ `6381`

### PostgreSQL
- **Interno:** `5432`
- **Externo:** `5432`

### Grafana
- **Interno:** `3000`
- **Externo:** `3000`

---

## 🛠️ Comandos Terraform

> Ubícate en la raíz del repo.

### 1) Inicializar
```bash
terraform init
terraform workspace list
terraform workspace new dev
terraform workspace select dev
docker ps

Accesos rápidos

Nginx:

http://localhost:8080

http://localhost:8081

http://localhost:8082

Grafana: http://localhost:3000

PostgreSQL: localhost:5432 (variables en terraform.tfvars)

Redis: puerto externo según workspace (ej. 6380 en dev)
