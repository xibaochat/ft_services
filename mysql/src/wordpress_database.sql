CREATE DATABASE wordpress;
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'secure_password';
GRANT ALL ON wordpress.* TO 'wp_user'@'%' ;
FLUSH PRIVILEGES;
