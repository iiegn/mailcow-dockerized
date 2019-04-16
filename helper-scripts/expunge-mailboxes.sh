#!/bin/bash
# Path to mailcow-dockerized, e.g. /opt/mailcow-dockerized
cd ~mailcow/mailcow-dockerized/

/usr/local/bin/docker-compose exec -T dovecot-mailcow doveadm expunge -A mailbox 'Junk' savedbefore 12w
/usr/local/bin/docker-compose exec -T dovecot-mailcow doveadm expunge -A mailbox 'Trash' savedbefore 52w

### crontab -e
#
#  # m h  dom mon dow   command
#  # Execute everyday at 04:00 A.M.
#  0 4 * * * ${HOME}/mailcow-dockerized/helper-scripts/expunge-mailboxes.sh
