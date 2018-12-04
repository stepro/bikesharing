FROM python:3-alpine3.8

WORKDIR /app
COPY requirements.txt .
RUN pip install
COPY . .

CMD ["python", "main.py"]
