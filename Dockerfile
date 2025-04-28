# Use the official Python 3.12 slim image as the base image.
FROM python:3.12-slim

# Install system dependencies (if needed) and pipenv.
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc build-essential && \
    pip install --no-cache-dir pipenv && \
    apt-get purge -y --auto-remove gcc build-essential && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container.
WORKDIR /app

# Copy Pipfile and Pipfile.lock into the container first.
# This allows Docker to cache dependency installation if the Pipfile(s) do not change.
COPY Pipfile Pipfile.lock* ./

# Install Python dependencies defined in the Pipfile. The "--deploy" flag causes the build to fail
# if the Pipfile.lock is not present or does not match the Pipfile.
RUN pipenv install --deploy --system

# Copy the rest of the application code into the container.
COPY . .

# Expose the port Streamlit uses (default is 8501).
EXPOSE 8501

# Set any required environment variables here or pass them at runtime.
# For example, you might need to configure COHERE_API_KEY and PINECONE_INDEX_NAME.
# ENV COHERE_API_KEY=your_api_key
# ENV PINECONE_INDEX_NAME=your_index_name

# Specify the default command to run the Streamlit app.
# The "--server.enableCORS=false" flag is added to avoid CORS issues in some deployments.
CMD ["streamlit", "run", "main.py", "--server.enableCORS=false"]
