#!/usr/bin/env bash
# Render an nginx template from this directory by substituting the
# __PLACEHOLDER__ tokens with real values.
#
# Usage:
#   DOMAIN=example.com \
#   WEBROOT=/srv/grav/dansal_grav \
#   PHP_FPM_SOCK=unix:/run/php/php8.4-fpm.sock \
#   CERTBOT_WEBROOT=/var/www/certbot \
#   ./render.sh grav-bootstrap.conf.template > /etc/nginx/sites-available/example.com.conf
set -euo pipefail

: "${DOMAIN:?Set DOMAIN, e.g. DOMAIN=example.com}"
: "${WEBROOT:?Set WEBROOT, e.g. WEBROOT=/srv/grav/dansal_grav}"
: "${PHP_FPM_SOCK:?Set PHP_FPM_SOCK, e.g. PHP_FPM_SOCK=unix:/run/php/php8.4-fpm.sock}"
: "${CERTBOT_WEBROOT:?Set CERTBOT_WEBROOT, e.g. CERTBOT_WEBROOT=/var/www/certbot}"

template="${1:?Usage: $0 <template-file>}"
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sed \
  -e "s#__DOMAIN__#${DOMAIN}#g" \
  -e "s#__WEBROOT__#${WEBROOT}#g" \
  -e "s#__PHP_FPM_SOCK__#${PHP_FPM_SOCK}#g" \
  -e "s#__CERTBOT_WEBROOT__#${CERTBOT_WEBROOT}#g" \
  "${dir}/${template}"
