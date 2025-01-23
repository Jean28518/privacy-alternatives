class Alternative {
  late String title; // Nice Name
  late String description; // Description
  late List<String> replacing; // Android App Codes
  late List<String> goodOtherApps; // Android App Codes
  late String code; // Android App Code

  Alternative(
      {required this.title,
      required this.description,
      required this.replacing,
      required this.goodOtherApps,
      required this.code});
}

final List<Alternative> ALTERNATIVES = [
  Alternative(
    title: 'DuckDuckGo',
    description:
        'Im Gegensatz zu anderen Browsern speichert DuckDuckGo keine Daten über dich, schützt deine Privatsphäre und blockiert Tracker. Ebenfalls bietet DuckDuckGo eine eigene Suchmaschine an, die keine personalisierten Suchergebnisse liefert.',
    replacing: [
      'com.android.chrome',
      'com.sec.android.app.sbrowser',
      'com.opera.browser',
      'com.microsoft.emmx',
      'com.opera.gx',
      'com.mi.globalbrowser',
    ],
    goodOtherApps: [
      'org.mozilla.firefox',
      'com.brave.browser',
      'org.ecosia.ecosia.android',
    ],
    code: 'com.duckduckgo.mobile.android',
  ),
];
