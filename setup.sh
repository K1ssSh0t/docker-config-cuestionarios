#!/bin/bash
set -e  # Termina el script si ocurre algún error

# 1. Clonar el primer repositorio
echo "Clonando el repositorio docker-config-cuestionarios..."
git clone https://github.com/K1ssSh0t/docker-config-cuestionarios.git

# Entrar en la carpeta del primer repositorio
cd docker-config-cuestionarios

# 2. Clonar el segundo repositorio dentro del primero
echo "Clonando el repositorio next-app-residencia-final..."
git clone -branch testNombres https://github.com/K1ssSh0t/next-app-residencia-final.git

# 3. Crear un archivo .env vacío dentro del segundo repositorio
echo "Creando el archivo .env en next-app-residencia-final..."
touch next-app-residencia-final/.env

# 4. Copiar el archivo Dockerfile-bun del primer repositorio al segundo repositorio
#    renombrándolo a Dockerfile
echo "Copiando Dockerfile-bun a next-app-residencia-final/Dockerfile..."
cp Dockerfile-bun next-app-residencia-final/Dockerfile

echo "Proceso completado con éxito."
