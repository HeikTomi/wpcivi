FROM theikkinen/private-repo:v1

COPY civicrm-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/civicrm-entrypoint.sh; \
    sed -i 's/exec "$@"/civicrm-entrypoint.sh\nexec "$@"/' /usr/local/bin/docker-entrypoint.sh

RUN sudo curl -LsS https://download.civicrm.org/cv/cv.phar -o /usr/local/bin/cv
RUN sudo chmod +x /usr/local/bin/cv

RUN cv core:install
RUN sudo cv dl --dev flexmailer shoreditch mosaico