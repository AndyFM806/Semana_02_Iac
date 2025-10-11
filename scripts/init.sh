
set -e  # detiene el script ante cualquier error

# Directorio donde están los archivos Terraform
cd "$(dirname "$0")/../iac"

echo "🧩 Inicializando Terraform..."
terraform init

# Listar workspaces existentes o crear 'dev' si no existe
if terraform workspace list | grep -q "dev"; then
  echo "🔹 Workspace 'dev' ya existe. Seleccionando..."
else
  echo "🔹 Creando workspace 'dev'..."
  terraform workspace new dev
fi

terraform workspace select dev

echo "🚀 Aplicando infraestructura..."
terraform apply -auto-approve

echo "✅ Despliegue completado exitosamente."
