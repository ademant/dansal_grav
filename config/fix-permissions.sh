#!/usr/bin/env bash
# Fix ownership of Grav's runtime directories so the webserver/php-fpm user
# can write to them.
#
# Why this is needed: these directories are gitignored, so a fresh `git
# clone`/checkout recreates them (via their tracked .gitkeep files) owned by
# whoever ran the command - usually a human/deploy user, not the webserver
# user. Grav also happily recreates cache/, images/, etc. itself if they're
# missing, again owned by whoever invoked `bin/grav`/`bin/plugin`. Either
# way, if that owner isn't the php-fpm user, PHP can't write to them and
# Grav serves its own "Grav Problems" page instead of the site.
#
# Safe to re-run any time: after a fresh clone, after `bin/grav clear-cache`
# run as a non-webserver user, after a deploy, or just when the site starts
# throwing "not writeable" errors.
#
# Usage:
#   sudo ./config/fix-permissions.sh
#   WEB_USER=www-data WEB_GROUP=www-data sudo -E ./config/fix-permissions.sh
set -euo pipefail

WEB_USER="${WEB_USER:-nginx}"   # php-fpm's `user` (see the pool's .conf)
WEB_GROUP="${WEB_GROUP:-nginx}" # php-fpm's `group`

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$dir"

runtime_dirs=(
  cache
  logs
  tmp
  backup
  images
  assets
  user/data
  user/accounts
)

if [[ "$(id -u)" -ne 0 ]]; then
  echo "Re-run with sudo (need to chown to ${WEB_USER}:${WEB_GROUP})." >&2
  exit 1
fi

for d in "${runtime_dirs[@]}"; do
  mkdir -p "$d"
  chown -R "${WEB_USER}:${WEB_GROUP}" "$d"
  echo "fixed: $d -> ${WEB_USER}:${WEB_GROUP}"
done
