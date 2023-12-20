# Usa una imagen de Python oficial como base
FROM python:3.10-slim

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

# Comando para ejecutar tu aplicación FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8001", "--reload"]
