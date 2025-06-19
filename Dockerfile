# Use a specific, stable Python image. slim is good for smaller images.
FROM python:3.9-slim

# Set the working directory inside the container.
# This is where your application code will reside.
WORKDIR /app

# Copy only the requirements.txt file first and install dependencies.
# This leverages Docker's layer caching. If only your app code changes,
# but not dependencies, this layer won't need to be rebuilt.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code into the working directory.
COPY . .

# Expose the port your application will run on.
# This is a declaration; you still need to map the port when running the container.
EXPOSE 5000

# Define the command to run your application when the container starts.
CMD ["python", "app.py"]