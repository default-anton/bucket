ROOT_DIR ?= "/home/bucket"
SSH_USER ?= "bucket"
SSH_HOST ?= "127.0.0.1"
SSH_PORT ?= "22"

.PHONY: all make_dirs deploy up ssh

all: make_dirs deploy up

make_dirs:
	@ssh $(SSH_USER)@$(SSH_HOST) "mkdir -p $(ROOT_DIR)/bucket/{torrents,media}/{movies,tv}"

deploy:
	@scp ./docker-compose.yml $(SSH_USER)@$(SSH_HOST):$(ROOT_DIR)/bucket/docker-compose.yml
	@scp ./.envrc $(SSH_USER)@$(SSH_HOST):$(ROOT_DIR)/bucket/.env

up:
	@ssh $(SSH_USER)@$(SSH_HOST) "cd $(ROOT_DIR)/bucket && docker compose up -d"

ssh:
	@ssh $(SSH_USER)@$(SSH_HOST) -p $(SSH_PORT) -t "cd $(ROOT_DIR)/bucket; bash -i"
