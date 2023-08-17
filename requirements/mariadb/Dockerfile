FROM debian:buster

RUN apt update -y \
    && apt upgrade -y
RUN apt install mariadb-server -y

COPY 50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY sql_script.sh    /var/sql_script.sh
CMD ["bash", "/var/sql_script.sh"]

EXPOSE 3306
