#!/bin/bash
set -euo pipefail

# Copy over fb0 to /dev/fb0
cp /root/.not_part_of_the_challenge/fb0 /dev/fb0
chmod 440 /dev/fb0
chown root:video /dev/fb0

exec /usr/bin/supervisord -c /etc/supervisord.conf
