FROM prestashop/base:7.2-fpm

RUN \
    # install packages and clean up
    apt-get update && apt-get install -y nginx && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    # install ioncube
    # download package & extract
    cd /tmp/ && wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz && \
    tar -zxvf /tmp/ioncube_loaders_lin_x86-64.tar.gz && \
    # save extensions
    mkdir -p /usr/local/ioncube && cp /tmp/ioncube/ioncube_loader_* /usr/local/ioncube && \
    # enable extension
    echo 'zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.2.so' > /usr/local/etc/php/conf.d/00-ioncube.ini && \
    # remove files
    rm -rf /tmp/ioncube && rm /tmp/ioncube_loaders_lin_x86-64.tar.gz
