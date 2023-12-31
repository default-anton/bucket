ROOT_DIR ?= "/home/bucket"
EXTRA_DATA_DIR ?= "/mnt/data"
SSH_USER ?= "bucket"
SSH_HOST ?= "127.0.0.1"
SSH_PORT ?= "22"

.PHONY: all make_dirs deploy up ssh

all: make_dirs deploy up

make_dirs:
	@ssh $(SSH_USER)@$(SSH_HOST) -p $(SSH_PORT) \
		"mkdir -p $(ROOT_DIR)/bucket/{torrents,media}/{movies,tv} $(ROOT_DIR)/bucket/books/inbox"
	@ssh $(SSH_USER)@$(SSH_HOST) -p $(SSH_PORT) \
		"mkdir -p $(EXTRA_DATA_DIR)/{torrents,media}/{movies,tv,books}"

deploy:
	@scp -P $(SSH_PORT) \
		./* \
		./.envrc \
		$(SSH_USER)@$(SSH_HOST):$(ROOT_DIR)/bucket/

up:
	@ssh $(SSH_USER)@$(SSH_HOST) -p $(SSH_PORT) "cd $(ROOT_DIR)/bucket && ./deploy.sh"

ssh:
	@ssh $(SSH_USER)@$(SSH_HOST) -p $(SSH_PORT) -t "cd $(ROOT_DIR)/bucket && bash -i"
