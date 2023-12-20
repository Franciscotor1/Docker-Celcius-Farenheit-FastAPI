# Usa una imagen de Python oficial como base
FROM python:3.10-slim

# Instala la utilidad 'entr'
RUN apt-get update && apt-get install -y entr && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo requirements.txt al contenedor en /app
COPY requirements.txt .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copia el contenido actual del directorio al contenedor en /app
COPY . .

# Expone el puerto 8001 para la aplicación FastAPI
EXPOSE 8001

# Comando para ejecutar tu aplicación y habilitar la recarga automática al guardar
CMD ["bash", "-c", "find . -name '*.py' | entr -r uvicorn main:app --host 0.0.0.0 --port 8001 --reload"]
