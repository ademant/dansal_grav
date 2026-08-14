# dansal_grav — Marketing/Docs Website for dansal

This repo is a **Grav CMS** site (v2.0.18, Quark 2 theme) whose purpose is to
present **dansal** — the software product — to the world. It is *not* dansal
itself; the product lives in a sibling repo (`../dansal`, Go). This Grav site
is currently the stock default install (Home + Typography demo pages) and has
not yet been customized. Actual site build-out is a future task.

## What is dansal?

**dansal — Dance Event Management System.** Open-source, self-hosted calendar
and event platform for folk and social dance communities (bal-folk, fest-noz,
workshops, festivals, open sessions). Written in Go, SQLite-backed, federates
with the fediverse via ActivityPub. MIT licensed.

Full product detail: `../dansal/README.md` and its guides
(`ADMIN_GUIDE.md`, `USER_GUIDE.md`, `DEVELOPER_GUIDE.md`, `API.md`,
`VISITOR_GUIDE.md`, `DOCKER.md`). Treat that repo as the source of truth for
feature claims — pull from there rather than re-deriving.

### Key capabilities to communicate on this site
- **Event discovery**: map with clustered pins, weekly calendar, filterable
  list, filters by type/style/town/date, JSON-LD structured data, iCal export.
- **Event management**: create/edit/publish/cancel via web admin, recurring
  series, image uploads, suggest-an-event wizard, duplicate detection,
  per-event timetables.
- **Feeds & import**: iCal/JSON feed import per organization, import preview
  with dedup, location alias matching.
- **Organizations & musicians**: org pages, musician/instructor profiles
  (MusicBrainz/Wikidata/Discogs/social links), role-based access
  (admin / publisher / user).
- **Community**: per-event bulletin board (ride-share, accommodation, tickets,
  lost & found), email/Telegram/Matrix notifications.
- **Fediverse**: per-organization ActivityPub actor, relay actor, IndexNow.
- **Booking**: optional registration, capacity, pricing models (free/donation/
  fixed/tiered).
- **Auth**: password + TOTP, passkeys, magic link (email/Telegram/Matrix),
  invitation-link registration.
- **i18n**: 12 UI languages.
- **Ops**: single SQLite DB, auto migrations, four binaries (API, web,
  admin CLI, web admin UI), multi-instance, automated backups, optional
  Docker.

## Primary audience for THIS website

**Event organizers** — people running dance socials/festivals/workshops who
are deciding whether to self-host dansal for their community. Copy and
navigation should lead with: what dansal does for an organizer (publish
events, manage a calendar, avoid duplicate listings, collect registrations),
how self-hosting/deployment works, and where to get it (GitHub, docs).
Secondary audience: dancers looking for events (discovery-oriented pages,
map/calendar demos) and developers/contributors.

## Status

- Grav is a fresh, unmodified default install (`user/pages/01.home`,
  `02.typography`). No dansal-specific content, theme customization, or
  navigation has been built yet.
- An `intro_map.avif` image has been dropped into `user/pages/01.home/` but
  is not yet referenced by any page — likely intended as a hero/intro image
  for the home page once real content is written.
- Next step (future session): design and build actual pages (home, features,
  for-organizers, self-hosting/get started, docs links, about/community)
  using the Quark 2 theme.
