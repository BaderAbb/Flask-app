FROM python:3.12-alpine

# Actualiza el índice de paquetes y actualiza los paquetes instalados
RUN apk update && apk upgrade
RUN pip install --upgrade pip

RUN mkdir -p home/app
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

USER appuser

WORKDIR home/app

COPY . .

RUN pip install -r requirements.txt

# exec python app.py
CMD ["python3", "app.py"]
