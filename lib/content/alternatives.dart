import 'package:privacy_alternatives/content/apps.dart';

class Alternative {
  late App app; // Nice Name
  late List<App> replacing; // Android App Codes
  late List<App> goodOtherApps; // Android App Codes

  Alternative({
    required this.app,
    required this.replacing,
    required this.goodOtherApps,
  });
}

final List<Alternative> ALTERNATIVES = [
  Alternative(
    app: APPS['com.duckduckgo.mobile.android']!,
    replacing: [
      APPS['com.android.chrome']!,
      APPS['com.sec.android.app.sbrowser']!,
      APPS['com.opera.browser']!,
      APPS['com.microsoft.emmx']!,
      APPS['com.opera.gx']!,
      APPS['com.mi.globalbrowser']!,
    ],
    goodOtherApps: [
      APPS['org.mozilla.firefox']!,
      APPS['com.brave.browser']!,
      APPS['org.ecosia.ecosia.android']!,
    ],
  ),
];

bool isAppGood(App app) {
  return ALTERNATIVES.any((alternative) =>
      alternative.goodOtherApps.contains(app) || alternative.app == app);
}

List<App> getAlternativesTo(App app) {
  // Find the right alternative
  Alternative alternative = ALTERNATIVES.firstWhere(
    (alternative) => alternative.app == app,
    orElse: () => ALTERNATIVES.firstWhere(
      (alternative) => alternative.replacing.contains(app),
      orElse: () => ALTERNATIVES.first,
    ),
  );
  List<App> alternatives = [];
  alternatives.add(alternative.app);
  alternatives.addAll(alternative.replacing);

  // Remove the app itself
  alternatives.remove(app);

  return alternatives;
}
