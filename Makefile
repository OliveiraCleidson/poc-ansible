.PHONY: up down control

# Define the location of the docker-compose file
COMPOSE_FILE := ./docker/docker-compose.yaml

# Start the containers in detached mode and start ssh service on each node
up:
	@docker-compose -f $(COMPOSE_FILE) up -d
	@docker exec node1 service ssh start
	@docker exec node2 service ssh start
	@docker exec control ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa 

# Stop and remove containers, networks, volumes, and images
down:
	@docker-compose -f $(COMPOSE_FILE) down

# Run bash in control container
control:
	@docker exec -it control bash
