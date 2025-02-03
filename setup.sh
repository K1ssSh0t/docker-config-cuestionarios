#!/bin/bash
set -e  # Termina el script si ocurre algún error

# 1. Clonar el primer repositorio
echo "Clonando el repositorio docker-config-cuestionarios..."
git clone https://github.com/K1ssSh0t/docker-config-cuestionarios.git

# Entrar en la carpeta del primer repositorio
cd docker-config-cuestionarios

# 2. Clonar el segundo repositorio dentro del primero
echo "Clonando el repositorio next-app-residencia-final..."
git clone --branch testNombres https://github.com/K1ssSh0t/next-app-residencia-final.git

# 3. Crear un archivo .env vacío dentro del segundo repositorio
echo "Creando el archivo .env en next-app-residencia-final..."
touch next-app-residencia-final/.env

# 4. Copiar el archivo Dockerfile-bun del primer repositorio al segundo repositorio
#    renombrándolo a Dockerfile
#echo "Copiando Dockerfile-bun a next-app-residencia-final/Dockerfile..."
#cp Dockerfile-bun next-app-residencia-final/Dockerfile

# VErsion de npm
#echo "Copiando Dockerfile-npm a next-app-residencia-final/Dockerfile..."
#cp Dockerfile-npm next-app-residencia-final/Dockerfile


# VErsion de pnpm
#echo "Copiando Dockerfile-pnpm a next-app-residencia-final/Dockerfile..."
#cp Dockerfile-pnpm next-app-residencia-final/Dockerfile

# VErsion de bun-node
echo "Copiando Dockerfile-bun-node a next-app-residencia-final/Dockerfile..."
cp Dockerfile-bun-node next-app-residencia-final/Dockerfile



# 5. Modificar el archivo next.config.ts en el segundo repositorio
NEXT_CONFIG_PATH="next-app-residencia-final/next.config.ts"
echo "Modificando el archivo next.config.ts..."

cat > "$NEXT_CONFIG_PATH" <<EOL
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
 eslint: {
    // Warning: This allows production builds to successfully complete even if
    // your project has ESLint errors.
    ignoreDuringBuilds: true,
  },
};

export default nextConfig;
EOL

echo "Proceso completado con éxito."
#DB_URL=postgres://postgres:mypassword@postgres:5432/postgres

#docker-compose up -d

#docker-compose exec nextjs sh

