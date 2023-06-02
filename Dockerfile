# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Copy the application files to the container
COPY . /var/www/html/

# Enable Apache modules
RUN a2enmod rewrite

# Install any necessary PHP extensions
RUN docker-php-ext-install pdo_mysql mysqli

# Expose port 80 for the Apache web server
EXPOSE 80

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Set the default command to run the Apache service in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

