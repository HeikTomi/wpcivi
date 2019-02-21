FROM theikkinen/private-repo:latest

## Install civix a extension building CLI for civiCMS
RUN sudo curl -LsS https://download.civicrm.org/civix/civix.phar -o /usr/local/bin/civix
RUN chmod +x /usr/local/bin/civix

COPY ./src/civicrm-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/civicrm-entrypoint.sh; \
    sed -i 's/exec "$@"/civicrm-entrypoint.sh\nexec "$@"/' /usr/local/bin/docker-entrypoint.sh
