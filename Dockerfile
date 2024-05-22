FROM python:3.12-alpine

# Actualiza el índice de paquetes y actualiza los paquetes instalados
RUN apk update && apk upgrade
RUN pip install --upgrade pip

# Crear un usuario no root y definir el directorio de trabajo
RUN mkdir -p home/app
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Cambiar al usuario no root
USER appuser

# Definir el directorio de trabajo
WORKDIR home/app

COPY . .

# Instalar las dependencias
RUN pip install -r requirements.txt

# exec python app.py
CMD ["python3", "app.py"]
