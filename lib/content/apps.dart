class App {
  late final String title;
  late final String description;
  late final String code;

  App({required this.title, required this.description, required this.code});
}

final Map<String, App> APPS = {
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
  'org.ecosia.ecosia.android': App(
    title: 'Ecosia',
    description:
        'Ein Webbrowser, der deine Privatsphäre respektiert und nebenbei Bäume pflanzt.',
    code: 'org.ecosia.ecosia.android',
  ),
};
