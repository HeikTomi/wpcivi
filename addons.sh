#!/bin/bash

cd /var/www/html/
su www-data -s cv core:install
su www-data -s cv dl --dev flexmailer shoreditch mosaico
