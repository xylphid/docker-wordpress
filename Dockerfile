FROM wordpress:4.9.6-php7.2-apache

LABEL maintainer.name="Anthony PERIQUET"
LABEL maintainer.email="anthony@periquet.net"
LABEL version=4.9.6-php7.2-apache
LABEL description="The WordPress rich content management system can utilize plugins, widgets, and themes."

ENV WORDPRESS_SUBDIRECTORY	""

COPY override-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["override-entrypoint.sh"]
CMD ["apache2-foreground"]