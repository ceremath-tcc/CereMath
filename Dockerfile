# Imagem PHP com Apache
FROM php:8.2-apache

# Instala o Python
RUN apt-get update && apt-get install -y python3 python3-pip

# Habilita extensões PHP comuns (como MySQL)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Instala a api da Cohere (IA)
RUN pip3 install cohere

# Copia o projeto para o servidor Apache
COPY . /var/www/html/

# Permissões (necessárias para executar os scripts)
RUN chmod -R 755 /var/www/html

EXPOSE 80
