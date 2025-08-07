FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install build dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the full app
COPY . .

# Build static assets (CRUCIAL)
RUN flask assets build

# Flask config
ENV FLASK_APP=CTFd
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port
EXPOSE 8000

# Start the app
CMD ["python", "serve.py"]
