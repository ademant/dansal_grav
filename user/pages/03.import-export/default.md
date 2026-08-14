---
title: Import & Export
menu: Import & Export
---

# Termine importieren und exportieren

dansal lässt sich unabhängig davon einsetzen, ob eine Organisation bereits
eine eigene Website hat oder nicht. Termine können über iCal- und
JSON-Feeds automatisch importiert und exportiert werden — je nach Bedarf
lassen sich damit drei typische Einsatzarten abbilden.

### 1. Eigene Website behalten, nur einen Kalender pflegen

Organisationen, die bereits eine eigene Website betreiben, müssen ihre
Termine nicht doppelt pflegen. Die Veranstaltungen werden ausschließlich in
dansal angelegt und dort verwaltet; die eigene Website übernimmt sie
automatisch über einen iCal- oder JSON-Feed
(`/feed/org/{organisation}/events.ical` bzw. `.json`). Änderungen — neue
Termine, Absagen, Zeitverschiebungen — erscheinen dadurch ohne manuellen
Zusatzaufwand auch auf der eigenen Seite.

**Vorteil:** Ein einziger, verbindlicher Kalender statt zweier Datenquellen,
die auseinanderlaufen können.

### 2. dansal als Datenbank nutzen und Termine einbetten

Organisationen ohne eigene Kalenderfunktion nutzen dansal als
Terminverwaltung im Hintergrund und binden die Ausgabe direkt per
`<iframe>` in ihre bestehende Website ein — zum Beispiel als
Terminliste, Kalender mit Karte, Organisationsprofil oder kurze
„Nächste Termine“-Übersicht. Es ist keine eigene Kalenderentwicklung
nötig, nur ein kurzer Einbettungscode.

**Vorteil:** Die eigene Website zeigt aktuelle Termine, ohne dass dafür
eigene Kalenderlogik gebaut oder gepflegt werden muss.

### 3. dansal als eigenständige Verwaltung nutzen

Organisationen ohne eigene Website — oder die ihre Termine dort bewusst
nicht anzeigen wollen — nutzen dansal vollständig eigenständig: Termine
anlegen und veröffentlichen, Anmeldungen und Kapazitäten verwalten,
die Pinnwand für Mitfahrgelegenheiten und Unterkunft nutzen, per
Fediverse ankündigen. Die dansal-Seite selbst übernimmt in diesem Fall
die öffentliche Auffindbarkeit — über Suchmaschinen, Kalender und Karte.

### Import bereits bestehender Termine

Wer seine Termine schon anderswo pflegt, muss nicht bei null anfangen:
dansal kann bestehende iCal- oder JSON-Feeds automatisch importieren.
Bereits bekannte Orte werden dabei wiedererkannt, mögliche Duplikate vor
der Übernahme angezeigt und ausgeschlossen.
