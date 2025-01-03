# Stage 1: Build Flask app
FROM python:3.13.1 AS flask_builder

# Set the working directory for the Flask app build stage
WORKDIR /app

# Copy the app files
COPY ./app /app

# Install dependencies from the requirements file
RUN pip install --no-cache-dir -r /app/req.txt

# Stage 2: Setup Nginx and Flask together
FROM nginx:stable-alpine AS final

# Remove the default Nginx site configuration
RUN rm /etc/nginx/conf.d/default.conf

# Install Python3 and pip (without using 'ensurepip')
RUN apk add --no-cache python3 py3-pip

# Set the working directory for Flask app
WORKDIR /app

# Create a virtual environment for Python dependencies
RUN python3 -m venv /app/venv

# Copy the Flask app and dependencies from the flask_builder stage
COPY --from=flask_builder /app /app

# Install Python dependencies into the virtual environment
RUN . /app/venv/bin/activate && pip install --no-cache-dir -r /app/req.txt

# Copy the Nginx config (ensure it's correct)
WORKDIR /etc/nginx
COPY ./nginx.conf /etc/nginx/nginx.conf

# Expose necessary ports
EXPOSE 80

# Start both Flask and Nginx
CMD ["sh", "-c", ". /app/venv/bin/activate && python3 /app/app.py & exec nginx -g 'daemon off;'"]
