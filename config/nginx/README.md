# Nginx + Let's Encrypt templates for this Grav site

Two templates, used in sequence, plus a render helper:

- `grav-bootstrap.conf.template` — HTTP-only. Serves the site and the ACME
  `http-01` challenge. Deploy this **first**, before any certificate exists.
- `grav.conf.template` — HTTP→HTTPS redirect + full TLS server block.
  Deploy this **after** you've obtained the certificate.
- `render.sh` — substitutes the `__PLACEHOLDER__` tokens with real values via
  `sed` (no `envsubst`, so nginx's own `$uri`/`$host` variables are left
  untouched).

Placeholders used in both templates:

| Placeholder           | Example                              |
|------------------------|---------------------------------------|
| `__DOMAIN__`           | `example.com`                        |
| `__WEBROOT__`          | `/srv/grav/dansal_grav`              |
| `__PHP_FPM_SOCK__`     | `unix:/run/php/php8.4-fpm.sock`      |
| `__CERTBOT_WEBROOT__`  | `/var/www/certbot`                   |

## First-time setup

1. **Install certbot** (Debian/Ubuntu): `apt install certbot`
   (no need for `python3-certbot-nginx` — this flow uses the webroot method,
   not certbot's nginx plugin).

2. **Create the ACME webroot** (kept outside the Grav docroot):
   ```bash
   mkdir -p /var/www/certbot
   ```

3. **Render and deploy the bootstrap config:**
   ```bash
   cd config/nginx
   DOMAIN=example.com \
   WEBROOT=/srv/grav/dansal_grav \
   PHP_FPM_SOCK=unix:/run/php/php8.4-fpm.sock \
   CERTBOT_WEBROOT=/var/www/certbot \
   ./render.sh grav-bootstrap.conf.template | sudo tee /etc/nginx/sites-available/example.com.conf

   sudo ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/
   sudo nginx -t && sudo systemctl reload nginx
   ```
   At this point the site is reachable over plain HTTP — confirm with
   `curl -I http://example.com/`.

4. **Point DNS** for `example.com` (and `www.example.com`, if used) at this
   server before continuing — the HTTP-01 challenge needs the domain to
   resolve here.

5. **Obtain the certificate:**
   ```bash
   sudo certbot certonly --webroot -w /var/www/certbot \
     -d example.com -d www.example.com
   ```
   This creates `/etc/letsencrypt/live/example.com/{fullchain,privkey,chain}.pem`.

6. **Render and deploy the final (HTTPS) config**, replacing the file from
   step 3:
   ```bash
   DOMAIN=example.com \
   WEBROOT=/srv/grav/dansal_grav \
   PHP_FPM_SOCK=unix:/run/php/php8.4-fpm.sock \
   CERTBOT_WEBROOT=/var/www/certbot \
   ./render.sh grav.conf.template | sudo tee /etc/nginx/sites-available/example.com.conf

   sudo nginx -t && sudo systemctl reload nginx
   ```
   Verify: `curl -I https://example.com/` should return `200`, and plain
   HTTP should now `301` to HTTPS.

7. **Enable HSTS** (optional, once HTTPS is confirmed working for all
   hostnames you serve): uncomment the `Strict-Transport-Security` header
   line in the rendered config and reload nginx again.

## Renewal

Certbot installs a systemd timer (`certbot.timer`) or cron job by default
that runs `certbot renew` twice daily; it's a no-op until a cert is within
30 days of expiry. Since nginx is already serving `/.well-known/acme-challenge/`
from `__CERTBOT_WEBROOT__` in the final config too, renewal works without any
downtime. Just make sure nginx reloads afterwards so it picks up the
renewed files:

```bash
sudo certbot renew --deploy-hook "systemctl reload nginx"
```

(Add `--deploy-hook` permanently by dropping a script in
`/etc/letsencrypt/renewal-hooks/deploy/`.)

## Notes

- Both templates carry Grav's standard hardening rules (deny access to
  `user/config`, `user/env`, `.git`, `cache`, `logs`, dotfiles, executable
  extensions under `system`/`vendor`/`user`, etc.) — kept in sync with
  `../../webserver-configs/nginx.conf` shipped by Grav itself.
- TLS settings follow Mozilla's "intermediate" profile using ECDHE-only
  ciphers, so no separate `dhparam` file is required.
- Adjust `PHP_FPM_SOCK` to match your php-fpm pool (check
  `/etc/php/*/fpm/pool.d/www.conf` → `listen = ...`).
