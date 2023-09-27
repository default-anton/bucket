ROOT_DIR := "/home/anton"
SSH_USER := "anton"
SSH_HOST := "10.0.0.124"

.PHONY: all
all: make_dirs deploy up

.PHONY: make_dirs
make_dirs:
	ssh $(SSH_USER)@$(SSH_HOST) "mkdir -p $(ROOT_DIR)/bucket/{torrents,media}/{movies,tv}"

.PHONY: deploy
deploy:
	@scp ./docker-compose.yml $(SSH_USER)@$(SSH_HOST):$(ROOT_DIR)/bucket/docker-compose.yml

.PHONY: up
up:
	ssh $(SSH_USER)@$(SSH_HOST) "cd $(ROOT_DIR)/bucket && docker compose up -d"
