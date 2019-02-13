#!/bin/bash

su www-data -s /bin/sh -c "wp core install \
  --url='10.174.52.21:8080' \
  --title='Example Site' \
  --admin_user='admin' \
  --admin_password='admin' \
  --admin_email='admin@example.com' \
  --skip-email"

su www-data -s /bin/sh -c "wp plugin activate civicrm"
