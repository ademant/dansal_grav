---
title: Import & Export
menu: Import & Export
---

# Wie kommen Termine in den Kalender?

dansal ist als übergreifender Kalender konzipiert, um Veranstaltungen verschiedener Folkclubs übersichtlich darzustellen. Wer Bälle veranstaltet, soll möglichst einfach auch auf dansal die Termine veröffentlichen. Ohne die Veranstaltung auf mehreren Seiten einzupflegen. Oder gar auf mehreren Seiten aktualisieren zu müssen. Hierzu bietet dansal verschiedene Wege, um Veranstaltungen unterschiedlicher Vereine auf einer Seite darstellen zu können.

![Übersicht: dansal als Datenbank für eingebettete Termine](overview_importexport.png)

## 1. Eigene Website behalten, nur einen Kalender pflegen

Folkclubs, die bereits eine eigene Website betreiben, müssen ihre
Termine nicht doppelt pflegen. Wenn Termine auf der Internetseite als iCal- oder JSON-Feed abgerufen werden können, reicht es aus, diesen Link bei dansal als dauerhafte Quelle einzupflegen. Die Veranstaltungen werden automatisch in dansal kopiert. Mit dansal können deutlich mehr Informationen zur Verfügung gestellt werden als üblich. Die Stärke liegt darin, die Veranstaltungen auf einer Karte darstellen zu können. Hierzu werden den Veranstaltungsorten Koordinaten zugeordnet. Alle künftigen Veranstaltungen werden diesen Orten zugewiesen und können dann auch direkt auf der Karte dargestellt werden, ohne dass auf der eigenen Webseite die Koordinaten eingepflegt werden müssen.

Einfache Änderungen, wie zeitlich Verschiebung um 1h, können bei einem erneuten Abruf des Feed automatisch übernommen werden. Anderer Ort braucht dagegen manuelles Eingreifen.

Manchmal ist es nich möglich oder gewünscht, den kompletten Kalender in dansal zu übernehmen. Wenn für die Tanzveranstaltung dann aber ein iCal-Link angeboten wird (häufig als "in Kalender übernehmen"), kann mit diesem Link eine einzelne Veranstaltung übernommen werden. Eine automatische Aktualisierung erfolgt dann nicht.

**Vorteil:** Ein einziger, verbindlicher Kalender (Folkclub-Kalender) statt zweier Datenquellen,
die auseinanderlaufen können.

## 2. Eigene Website behalten, Termine mit dansal-Plugin verwalten
Viele Webseiten, mit denen Folkclubs ihre Internetseiten betreiben, verwenden WordPress oder vergleichbare Software. Für dansal existiert ein WordPress-Plugin, welches Veranstaltungen direkt mit dansal synchronisiert. Die Eigenschaften von dansal können direkt hier genutzt werden, um bei den Veranstaltungsorten den Tanzboden zu verwalten und weitere Punkte.

**Vorteil:** Verwaltung der Termine an einer Stelle und direkt an zwei Orten veröffentlicht.

## 3. dansal als Datenbank nutzen und Termine einbetten

Es gibt einzelne Folkclubs, welche z.B. Google Calendar verwenden und die dort eingepflegten Termine auf der eigenen Seite darstellen. Dies hat den Vorteil, dass die eigene Seite sehr einfach gehalten werden kann und keine komplexen Plugins verwaltet werden müssen. dansal kann alternativ zu einem Google Calendar verwendet werden: Die Termine werden auf dansal verwaltet. Auf der eigenen Seite können die Termine als Tabelle oder Liste eingebunden werden. Auch eine Darstellung auf einer Karte ist möglich.

**Vorteil:** Die eigene Website zeigt aktuelle Termine, ohne dass dafür
eigene Kalenderlogik gebaut oder gepflegt werden muss.

## 4. dansal als eigenständige Verwaltung nutzen

Organisationen ohne eigene Website — oder die ihre Termine dort bewusst
nicht anzeigen wollen — nutzen dansal vollständig eigenständig: Termine
anlegen und veröffentlichen, Anmeldungen und Kapazitäten verwalten,
die Pinnwand für Mitfahrgelegenheiten und Unterkunft nutzen, per
Fediverse ankündigen. Die dansal-Seite selbst übernimmt in diesem Fall
die öffentliche Auffindbarkeit — über Suchmaschinen, Kalender und Karte.

# Technik
## 1. Import über iCal
iCal ist ein Standard, um Termine maschinenlesbar zu verbreiten, so dass die Termine direkt im eigenen Kalender auf dem Smartphone oder Desktop dargestellt werden. Diese Technik wird verwendet, um Termine in dansal einzulesen. Moderner ist das Format JSON. Letztlich sind beides lesbare Textdateien, die nur anders strukturiert sind. Je nach Software sind diese Textdateien etwas unterschiedlich gefüllt. Dies führt dazu, dass manchmal nicht alle interessanten Informationen übertragen werden.

Mit dansal können diese Textdateien geladen und die einzelnen Veranstaltungen kopiert werden.

iCal ist relativ alt und bietet nur die wichtigsten Informationen an, so dass nur ein Teil der Möglichkeiten von dansal genutzt werden. Dies liegt oft auch daran, dass für das eigene Publikum zum Beispiel keine Darstellung auf einer Karte benötigt wird, da der Ort den Leuten bekannt ist. So ist manchmal nur der Name des Orts genannt, aber keine Adresse oder Koordinaten.

Beim Einlesen der Termine werden automatisch Veranstaltungsorte angelegt. Bei neuen Veranstaltungen werden die Termine direkt diesen Orten zugewiesen. Auf dansal können die Orte um Zusatzinformationen erweitert werden, wie die Kartendarstellungen. Diese werden dann für alle künftigen Veranstaltungen übernommen. Der Pflegeaufwand auf dansal ist damit gering. Nur anfangs müssen Veranstaltungsorte gepflegt werden, danach werden nur Termine auf der eigenen Webseite gepflegt.

### WordPress-Plugins mit iCal-Export

Wer seine Termine bereits mit einem WordPress-Kalender-Plugin pflegt, kann die
kostenlose Version davon oft direkt als iCal-Quelle bei dansal einbinden.
Folgende Plugins bieten schon in der kostenlosen Version einen vollständigen
iCal-Feed mit allen Terminen an, ohne dass dafür eine Pro-Version nötig ist:

* **Events Manager** — vollständiger iCal-Export aller Termine ist im
  Free-Plugin enthalten.
* **Event Organiser** — bietet einen seitenweiten ICS-Feed bereits in der
  kostenlosen Version.
* **All-in-One Event Calendar (Timely)** — enthält einen iCal-Abo-Link für
  den gesamten Kalender im Free-Plugin.
* **Sugar Calendar** — der iCal-Export ist bei diesem Plugin nach aktuellem
  Stand teils nur als kostenpflichtige Erweiterung verfügbar; vor dem
  Einrichten lohnt sich ein Blick in die aktuelle Plugin-Beschreibung.

Andere verbreitete Plugins wie **The Events Calendar** oder **Modern Events
Calendar** bieten in der kostenlosen Version meist nur den iCal-Export
einzelner Termine an; ein Feed mit allen Terminen ist dort oft der
kostenpflichtigen Pro-Version vorbehalten.

### Andere iCal-Exportmethoden

WordPress-Plugins sind der häufigste Fall, aber nicht die einzige Quelle
für einen iCal-Feed. dansal kann grundsätzlich jeden öffentlich
erreichbaren iCal-Link einbinden, unabhängig davon, womit er erzeugt
wurde:

* **Google Kalender** — ein öffentlicher Kalender bietet unter den
  Kalendereinstellungen eine "Geheime Adresse im iCal-Format", die sich
  direkt als Quelle einpflegen lässt.
* **Andere CMS/Kalender-Software** — z. B. Drupal-Kalendermodule,
  Nextcloud-Kalender oder Vereinsverwaltungssoftware, die einen
  ICS-Abo-Link anbieten.
* **Manuell gepflegte .ics-Datei** — auch eine von Hand erstellte und auf
  dem eigenen Webspace abgelegte iCal-Datei funktioniert, solange sie
  über eine feste URL erreichbar ist.

In allen Fällen gilt dieselbe Einschränkung wie beim WordPress-Feed: iCal
transportiert nur die wichtigsten Felder — Titel, Start-/Endzeit und
Beschreibung. Zusätzliche dansal-Funktionen wie Kartendarstellung oder
Tanzstile müssen bei Bedarf separat ergänzt werden.

### Einbindung in dansal
Der Link zu einem iCal wird in dansal eingepflegt und dort konfiguriert. Einem iCal-Url kann ein Folkclub zugewiesen werden, welcher als Organisator angezeigt wird. Zusätzlich kann eine Veranstaltungsart (Bal, Workshop, Festival) allen in dem iCal enthaltenen Veranstaltungen zugewiesen werden. Ebenso können Tanzstile vorgegeben werden.

Die in den Veranstaltungen hinterlegten Orte werden automatisch angelegt. Sind dort Koordinaten angegeben, kann die Veranstaltung direkt auf der Karte angezeigt werden. Ansonsten wird die Veranstaltung nur in der Wochenübersicht dargestellt. Ohne Koordinaten müssen diese in den Verwaltung der Orte separat nachgepflegt werden. Ist in dem iCal eine Adresse angegeben, kann hieraus die Koordinaten ermittelt und gespeichert werden.

## 2. Eigene WordPress-Seite mit dansal-Plugin
Für WordPress existiert ein Plugin, welches über die REST-API direkt Veranstaltungen auf dansal verarbeiten kann. Auf dansal wird ein Service-Account für einen Folkclub angelegt und eine Registrierungs-URL erzeugt. Mit dieser URL verbindet sich das Plugin mit der dansal-Instanz und es werden Zugangsdaten ausgetauscht. Das Plugin kann direkt die hinterlegten Orte als auch Veranstaltungen auf der dansal-Instanz verarbeiten. Lokal in der WordPress-Instanz wird eine Kopie gehalten, sollte die Verbindung zur dansal-Instanz verloren gehen.

## 3. dansal Termine auf eigene Webseite einbinden
Die Veranstaltungen lassen sich als iFrame oder embed Element in der eigenen Seite einbinden. Hierzu lassen sich verschiedene Filter anwenden, um Termine beispielsweise nur von einem Folkclub darzustellen. Die Termine werden auf dansal mit einem Nutzerkonto erstellt und verwaltet, wie bei einem Google Kalender.

## 4. Veranstaltungen direkt auf dansal einpflegen

Ohne Feed, Plugin oder REST-API lassen sich Termine auch direkt auf dansal
angelegt werden. Dafür gibt es zwei Wege, je nachdem ob ein Benutzerkonto
vorhanden ist oder nicht.

### Als angemeldeter Nutzer

Mit einem Benutzerkonto wird die Veranstaltung sofort in der Verwaltung von
dansal erfasst — inklusive aller Möglichkeiten wie Bild-Upload,
wiederkehrende Reihen, Timetable, Anmeldung/Kapazität und Preismodellen.
Je nach zugewiesener Rolle unterscheidet sich, was bearbeitet werden kann:

* **Nutzer:in (`user`)** — legt Termine ausschließlich für die eigene
  Organisation an.
* **Admin (`admin`)** — hat vollen Zugriff auf die gesamte Instanz.

Ein Konto wird entweder von einem Admin angelegt oder über einen
Einladungslink eingerichtet; die Veranstaltung erscheint nach dem
Speichern direkt und ohne weitere Prüfung, sobald sie veröffentlicht wird.

### Als anonyme Person (Vorschlag)

Fehlt ein Benutzerkonto, kann ein Termin trotzdem vorgeschlagen werden —
ganz ohne Registrierung:

1. Über den Vorschlags-Assistenten Titel, Datum, Ort und Beschreibung
   eintragen; optional lässt sich ein Bild hochladen.
2. In der Vorschau weist dansal bereits auf mögliche Duplikate mit
   bestehenden Terminen hin.
3. Vorschlag absenden und per E-Mail oder Telegram verifizieren, um Spam
   zu vermeiden.
4. Der Vorschlag geht an die Admins der Instanz und wird erst nach
   Prüfung veröffentlicht.

Der Unterschied zum angemeldeten Weg liegt also im Freigabeschritt: Ein
Konto veröffentlicht direkt, ein anonymer Vorschlag durchläuft vorher eine
manuelle Prüfung. Details zum Vorschlags-Assistenten aus Besuchersicht
stehen im Kapitel [Für Besucher:innen](../04.fuer-besucher).
