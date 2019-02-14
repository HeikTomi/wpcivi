#!/bin/bash

# Update basic info url/port if needed
su www-data -s /bin/sh -c "wp core install \
  --url='localhost:8080' \
  --title='Example Site' \
  --admin_user='admin' \
  --admin_password='admin' \
  --admin_email='admin@example.com' \
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
