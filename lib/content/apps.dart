import 'dart:typed_data';

class App {
  late final String title;
  late final String description;
  late final String code;
  Uint8List? icon;

  App({required this.title, required this.description, required this.code});
}

final Map<String, App> APPS = {
  // ALL WEBBROWSERS
  'com.duckduckgo.mobile.android': App(
    title: 'DuckDuckGo',
    description:
        'Im Gegensatz zu anderen Browsern speichert DuckDuckGo keine Daten über dich, schützt deine Privatsphäre und blockiert Tracker. Ebenfalls bietet DuckDuckGo eine eigene Suchmaschine an, die keine personalisierten Suchergebnisse liefert.',
    code: 'com.duckduckgo.mobile.android',
  ),
  'com.android.chrome': App(
    title: 'Chrome',
    description:
        'Ein beliebter und effizienter Webbrowser von Google. Dieser Browser schützt nicht deine Privatsphäre im Internet.',
    code: 'com.android.chrome',
  ),
  'com.sec.android.app.sbrowser': App(
    title: 'Samsung Internet',
    description:
        'Der Standard-Webbrowser auf Samsung-Geräten. Dieser Browser schützt nicht deine Privatsphäre im Internet.',
    code: 'com.sec.android.app.sbrowser',
  ),
  'com.opera.browser': App(
    title: 'Opera',
    description:
        'Ein schneller und sicherer Webbrowser von Opera. Leider ist er nicht quelloffen, weshalb er aufgrund von Transparenz- und Datenschutzbedenken nicht empfohlen wird.',
    code: 'com.opera.browser',
  ),
  'com.microsoft.emmx': App(
    title: 'Edge',
    description:
        'Ein Webbrowser von Microsoft. Der Browser sendet standardmäßig viele Daten an Microsoft-Server.',
    code: 'com.microsoft.emmx',
  ),
  'com.opera.gx': App(
    title: 'Opera GX',
    description:
        'Ein Webbrowser von Opera, der sich an Gamer richtet. Leider ist er nicht quelloffen, weshalb er aufgrund von Transparenz- und Datenschutzbedenken nicht empfohlen wird.',
    code: 'com.opera.gx',
  ),
  'com.mi.globalbrowser': App(
    title: 'Mi Browser',
    description:
        'Ein Webbrowser von Xiaomi. Der Browser sendet standardmäßig viele Daten an Xiaomi-Server.',
    code: 'com.mi.globalbrowser',
  ),
  'org.mozilla.firefox': App(
    title: 'Firefox',
    description:
        'Ein quelloffener Webbrowser von Mozilla, der deine Privatsphäre respektiert.',
    code: 'org.mozilla.firefox',
  ),
  'com.brave.browser': App(
    title: 'Brave',
    description:
        'Ein quelloffener Webbrowser, der deine Privatsphäre respektiert und Werbung blockiert.',
    code: 'com.brave.browser',
  ),
  'com.ecosia.android': App(
    title: 'Ecosia',
    description:
        'Ein Webbrowser, der deine Privatsphäre respektiert und nebenbei Bäume pflanzt.',
    code: 'com.ecosia.android',
  ),
  // ALL MESSENGERS
  'org.telegram.messenger': App(
    title: 'Telegram',
    description:
        'Ein quelloffener Messenger. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
    code: 'org.telegram.messenger',
  ),
  'com.whatsapp': App(
    title: 'WhatsApp',
    description:
        'Ein Messenger von Facebook. Nachrichten werden standardmäßig Ende-zu-Ende-verschlüsselt.',
    code: 'com.whatsapp',
  ),
  'com.facebook.orca': App(
    title: 'Messenger',
    description:
        'Ein Messenger von Facebook. Nachrichten werden standardmäßig Ende-zu-Ende-verschlüsselt.',
    code: 'com.facebook.orca',
  ),
  'com.discord': App(
    title: 'Discord',
    description:
        'Ein Messenger für Gamer. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
    code: 'com.discord',
  ),
  'org.thoughtcrime.securesms': App(
    title: 'Signal',
    description:
        'Ein quelloffener Messenger. Nachrichten werden standardmäßig Ende-zu-Ende-verschlüsselt.',
    code: 'com.signalapp',
  ),
  'com.skype.raider': App(
    title: 'Skype',
    description:
        'Ein Messenger von Microsoft. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
    code: 'com.skype.raider',
  ),
  'com.snapchat.android': App(
    title: 'Snapchat',
    description:
        'Ein Messenger, der sich auf Bilder und Videos spezialisiert hat. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
    code: 'com.snapchat.android',
  ),
  'com.google.android.apps.meetings': App(
    title: 'Google Meet',
    description:
        'Ein Messenger von Google. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
    code: 'com.google.android.apps.meetings',
  ),
  'com.google.android.apps.tachyon': App(
    title: 'Google Duo',
    description:
        'Ein Messenger von Google. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
    code: 'com.google.android.apps.tachyon',
  ),
  'im.vector.app': App(
    title: 'Element',
    description:
        'Ein quelloffener Messenger, der auf dem Matrix-Protokoll basiert und standardmäßig Ende-zu-Ende-verschlüsselt ist.',
    code: 'im.vector.app',
  ),
};
