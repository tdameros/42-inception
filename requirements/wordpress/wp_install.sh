./var/wp-cli.phar core download --path=/var/www/wordpress --allow-root

sleep 5

./var/wp-cli.phar config create	--allow-root \
            --dbname=$SQL_DATABASE \
            --dbuser=$SQL_USER \
            --dbpass=$SQL_PASSWORD \
            --dbhost=mariadb:3306 --path='/var/www/wordpress'

./var/wp-cli.phar core install --allow-root \
            --url="${WP_URL}" \
            --title="${WP_TITLE}" \
            --admin_user="${WP_ADMIN_USER}" \
            --admin_password="${WP_ADMIN_PASSWORD}" \
            --admin_email="${WP_ADMIN_EMAIL}" \
            --path='/var/www/wordpress'

mkdir -p /run/php
/usr/sbin/php-fpm7.3 -F

