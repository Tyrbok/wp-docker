version: '3.3'

services:
   db:
     container_name: wpd_db_{name}_{id}
     image: mysql:5.7
     volumes:
       - db_{id}_data:/var/lib/mysql
     restart: always
     ports:
      - "{db_port}:3306"
     environment:
       MYSQL_ROOT_PASSWORD: somewordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress

   wordpress:
     container_name: wpd_web_{name}_{id}
     depends_on:
       - db
     image: wordpress:latest
     volumes:
       - ./src/:/var/www/html
     ports:
       - "{web_port}:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
       WORDPRESS_TABLE_PREFIX: wp_{table_prefix}_
volumes:
    db_{id}_data: