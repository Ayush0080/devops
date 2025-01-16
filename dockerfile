FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y apache2 zip unzip wget

# Set working directory to /var/www/html
WORKDIR /var/www/html

# Download the ZIP file
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip

# Unzip the file and debug the structure
RUN unzip mediplus-lite.zip && ls -l

# Copy files based on the structure
# (Assuming files are extracted directly without a directory)
RUN cp -rvf * .

# Clean up unnecessary files
RUN rm -rf mediplus-lite.zip mediplus-lite

# Expose the port for Apache
EXPOSE 80
