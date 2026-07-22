FROM python:3.11-slim

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Set working directory to Flask folder
WORKDIR /app/employee ml/Flask

EXPOSE 8000

# Run Flask app with gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
