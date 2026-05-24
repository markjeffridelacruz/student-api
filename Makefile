# --- VARIABLES ---
IMAGE_NAME	= student-api
VERSION		= local
PORT		= 3000

# Define the default target
all: install build

# Install project dependencies
install:
	npm install

# Run the development server
dev:
	npm run dev

# Clean up node_modules or build artifacts
clean:
	rm -rf node_modules

# Build the Docker image
docker-build:
	docker build -t $(IMAGE_NAME):$(VERSION) .

# Run the Docker container locally
docker-run:
	docker run -d \
		-p $(PORT):$(PORT) \
 		--env-file .env \
 		--name $(IMAGE_NAME) \
 		$(IMAGE_NAME):$(VERSION)

# Stop the running Docker container
docker-stop: 
	docker stop $(IMAGE_NAME) || true

# Remove the Docker image and stopped container
docker-clean:
	docker rm $(IMAGE_NAME) || true
	docker rmi $(IMAGE_NAME):$(VERSION) || true

.PHONY: install dev test clean docker-build docker-run docker-stop docker-clean docker-clean-image