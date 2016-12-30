FROM php:7.0-cli

MAINTAINER Mirko Haaser

# Update
RUN apt-get update

# Install some tools
RUN apt-get install -y zip curl unzip git

# Install latest composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

# install npm
RUN apt-get install -y -qq npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

# install bower
RUN npm install --global bower grunt-cli

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
