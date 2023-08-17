
DIRECTORY			=	$(shell basename "$$(pwd)")

WORDPRESS_VOLUME	=	$(DIRECTORY)_wordpress
MARIADB_VOLUME		=	$(DIRECTORY)_mariadb

re:
	rm -rf mariadb/* wordpress/* &&\
	 docker-compose up --build

fclean:
	rm -rf ~/data/wordpress/* ~/data/mariadb/*
	docker volume rm -f $(WORDPRESS_VOLUME)
	docker volume rm -f $(MARIADB_VOLUME)
