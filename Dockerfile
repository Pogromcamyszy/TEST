# Stage 1: Build Flask app
FROM python:3.13.1 AS flask_builder

WORKDIR /app
COPY ./app /app
RUN pip install --no-cache-dir -r /app/req.txt

# Stage 2: Setup Nginx and Flask together
FROM nginx:stable-alpine AS final

RUN apk add --no-cache python3 py3-pip

WORKDIR /app
COPY --from=flask_builder /app /app
RUN pip install --no-cache-dir -r /app/req.txt

COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

CMD ["sh", "-c", "python3 /app/app.py & exec nginx -g 'daemon off;'"]