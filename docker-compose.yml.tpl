version: '3.3'

services:
   db:
     image: mysql:5.7
     volumes:
       - {prefix}_db_data:/var/lib/mysql
     restart: always
     ports:
      - "3306:3306"
     environment:
       MYSQL_ROOT_PASSWORD: somewordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress

   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     volumes:
       - ./src/:/var/www/html
     ports:
       - "{port}:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
       WORDPRESS_TABLE_PREFIX: wp_{prefix}_
volumes:
    {prefix}_db_data: