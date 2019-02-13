#!/bin/bash

cd /var/www/html/
su www-data -s /bin/sh -c "cv core:install"
su www-data -s /bin/sh -c "cv dl --dev flexmailer shoreditch mosaico"
