#!/bin/bash

# Define the image name
IMAGE_NAME="cyber-doc-env"

# Check if the Docker image already exists
if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
  echo "Docker image $IMAGE_NAME not found. Building the image..."

  # Path to the directory containing the Dockerfile
  # Update this if your Dockerfile is in a different directory
  DOCKERFILE_DIR="."

  # Build the Docker image
  docker build -t $IMAGE_NAME $DOCKERFILE_DIR
else
  echo "Docker image $IMAGE_NAME found."
fi

# Run the Docker container
echo "Running the $IMAGE_NAME Docker container..."
docker run -it $IMAGE_NAME
