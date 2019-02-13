#!/bin/bash

su www-data -s /bin/sh -c "wp core install \
  --url='192.168.1.101:8080' \
  --title='Example Site' \
  --admin_user='admin' \
  --admin_password='admin' \
  --admin_email='admin@example.com' \
  --skip-email"

su www-data -s /bin/sh -c "wp plugin activate civicrm"

cd /var/www/html/
su www-data -s /bin/sh -c "cv core:install"
su www-data -s /bin/sh -c "cv dl --dev flexmailer shoreditch mosaico"
