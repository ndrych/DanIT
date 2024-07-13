# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install Flask (you can specify a specific version if needed)
RUN pip install flask

# Expose the port that the Flask app runs on
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=server.py

# Run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]

