#!/bin/bash
set -euo pipefail

if [[ "$1" == apache2* ]] || [ "$1" == php-fpm ]; then
    # allow use subdirectory in the wordpress site url and home configs, like: http://localhost/blog
    if ! [ -z "$WORDPRESS_SUBDIRECTORY" ]; then
        # force relative path
        WORDPRESS_SUBDIRECTORY=`echo $WORDPRESS_SUBDIRECTORY | sed 's/^\///g'`
        mkdir -p $WORDPRESS_SUBDIRECTORY
        cd $WORDPRESS_SUBDIRECTORY
    fi
fi

docker-entrypoint.sh $@