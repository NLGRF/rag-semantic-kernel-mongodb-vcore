# Use an official Python image as the base
FROM python:3.10-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    QUART_APP=src.quartapp \
    QUART_ENV=development \
    QUART_DEBUG=true

# Set the working directory
# WORKDIR /app

# Copy the app code into the container
COPY . .

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements-dev.txt && \
    pip install -e src

# Expose the port the app runs on
EXPOSE 5000

# Start the quart app
CMD ["quart", "run", "--reload", "--host=0.0.0.0"]
