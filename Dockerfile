FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENV PORT=80
EXPOSE 80
CMD ["sh","-c","gunicorn --bind 0.0.0.0:${PORT} --workers 2 config.wsgi:application"]
