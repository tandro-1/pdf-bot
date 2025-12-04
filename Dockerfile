FROM python:3.9-slim

# تثبيت LibreOffice والخطوط الضرورية
RUN apt-get update && apt-get install -y \
    libreoffice \
    fonts-opensymbol \
    fonts-liberation \
    fonts-dejavu \
    curl \
    && apt-get clean

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "bot.py"]
