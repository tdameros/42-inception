DIRECTORY			=	$(shell basename "$$(pwd)")

WORDPRESS_VOLUME	=	$(DIRECTORY)_wordpress
MARIADB_VOLUME		=	$(DIRECTORY)_mariadb

NGINX_IMAGE			=	nginx
WORDPRESS_IMAGE		=	wordpress
MARIADB_IMAGE		=	mariadb

include .env

.PHONY: all
all: $(WORDPRESS_VOLUME_PATH) $(MARIADB_VOLUME_PATH)
	$(MAKE) up

.PHONY: up
up:
	docker-compose up --build

.PHONY: down
down:
	docker-compose down

.PHONY: stop
stop:
	docker-compose stop

.PHONY: restart
restart:
	docker-compose restart

.PHONY: clean
clean: down
	docker volume rm -f $(WORDPRESS_VOLUME) $(MARIADB_VOLUME)
	docker image rm -f $(NGINX_IMAGE) $(WORDPRESS_IMAGE) $(MARIADB_IMAGE)

.PHONY: fclean
fclean: clean
	rm -rf $(WORDPRESS_VOLUME_PATH)/* $(MARIADB_VOLUME_PATH)/*

.PHONY: re
re: fclean
	$(MAKE) all

$(WORDPRESS_VOLUME_PATH):
	mkdir -p $(WORDPRESS_VOLUME_PATH)

$(MARIADB_VOLUME_PATH):
	mkdir -p $(MARIADB_VOLUME_PATH)
