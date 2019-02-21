#!/bin/bash

# Update basic info url/port if needed
su www-data -s /bin/sh -c "wp core install \
  --url=${WORDPRESS_BASE_URL} \
  --title=${SITE_TITLE} \
  --admin_user=${WORDPRESS_ADMIN_USER} \
  --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
  --admin_email=${WORDPRESS_ADMIN_EMAIL} \
  --skip-email"

#Activate civicrm
su www-data -s /bin/sh -c "wp plugin activate civicrm"

# Install and activae civicrm admin utiliets
su www-data -s /bin/sh -c "wp plugin install civicrm-admin-utilities"
su www-data -s /bin/sh -c "wp plugin activate civicrm-admin-utilities"

# Install and activae members for role management
su www-data -s /bin/sh -c "wp plugin install members"
su www-data -s /bin/sh -c "wp plugin activate members"

## Install activated civicrm and add mosaico extension and dependencies
cd /var/www/html/
su www-data -s /bin/sh -c "cv core:install"
su www-data -s /bin/sh -c "cv dl --dev flexmailer shoreditch mosaico"

echo "Up and running in: " ${WORDPRESS_BASE_URL}

echo ${WORDPRESS_ADMIN_USER} ":" ${WORDPRESS_ADMIN_PASSWORD} ":" ${WORDPRESS_ADMIN_EMAIL}
