📘 2️⃣ README.md — Actualizado y profesional

Crea o reemplaza el archivo README.md en la raíz con este contenido 👇

# 🧩 Laboratorio Terraform + Docker

Este proyecto implementa una infraestructura de múltiples contenedores Docker administrados mediante **Terraform**
---

## 📁 Estructura del proyecto



Semana_02_IaC/
├── iac/
│ ├── main.tf
│ ├── networks.tf
│ ├── nginx.tf
│ ├── postgre.tf
│ ├── redis.tf
│ ├── grafana.tf
│ ├── variables.tf
│ ├── terraform.tfvars
│ └── files/
│ └── web/
│ └── index.html
├── config/
│ ├── inventory.ini
│ └── playbook.yml
├── templates/
│ └── nginx.conf
└── scripts/
└── init.sh


---

## 🚀 Despliegue automático

Ejecuta el siguiente comando desde la raíz del proyecto para inicializar y aplicar la infraestructura:

```bash
bash scripts/init.sh


Si trabajas directamente en PowerShell (Windows), puedes ejecutar los comandos Terraform manualmente desde iac/:

terraform init
terraform workspace new dev
terraform workspace select dev
terraform apply -auto-approve

🌐 Contenedores desplegados
Servicio	Imagen	Puerto externo	Puerto interno	Descripción
NGINX App 1	nginx:latest	8080	80	Página estática index.html
NGINX App 2	nginx:latest	8081	80	Página estática index.html
NGINX App 3	nginx:latest	8082	80	Página estática index.html
Redis	redis:8.2.2-alpine	6380	6379	Cache y cola de mensajes
PostgreSQL	postgres:latest	5432	5432	Base de datos relacional
Grafana	grafana/grafana:12.2.0	3000	3000	Monitoreo y dashboards
⚙️ Archivos estáticos

El contenido HTML que sirve NGINX se encuentra en:

iac/files/web/index.html


Ejemplo de vista:

<h1>Bienvenido a App desplegada con Terraform + Docker</h1>


Cada contenedor NGINX monta esa carpeta dentro de /usr/share/nginx/html.

🔧 Automatización post-provisioning (Ansible)

Se incluye la carpeta config/ con la estructura base de Ansible para automatización post-provisioning.
Dado que la infraestructura se ejecuta sobre Windows, Ansible no se ejecuta localmente, pero el código queda preparado para su uso en entornos Linux/WSL.

🧹 Limpieza de recursos

Para destruir toda la infraestructura:

cd iac
terraform destroy -auto-approve

🧠 Créditos

Proyecto desarrollado por Andy Fernandez Muguerza y Diego Jara Tirado
Correcciones aplicadas por Andy Fernandez Muguerza

REFORZAMIENTO: Firewall (nicolaka/netshoot)
Para aplicar solo este componente:
terraform apply -auto-approve -target='docker_container.firewall'
- Actúa como **puente de red entre la red pública y privada** (`public_net` y `private_net`).
- Permite ejecutar reglas `iptables` para filtrar tráfico entre zonas internas y externas.
- Imagen utilizada: `nicolaka/netshoot` versión `latest`, asi me sale en dockerhub, la anterior es la v0.14
- Está conectado a ambas redes con capacidades `NET_ADMIN` activas.
