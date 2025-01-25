import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:privacy_alternatives/content/apps.dart';
import 'package:privacy_alternatives/services/installed_apps.dart';

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
      APPS['com.ecosia.android']!,
    ],
  ),
  //   'org.telegram.messenger': App(
  //   title: 'Telegram',
  //   description:
  //       'Ein quelloffener Messenger. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
  //   code: 'org.telegram.messenger',
  // ),
  // 'com.whatsapp': App(
  //   title: 'WhatsApp',
  //   description:
  //       'Ein Messenger von Facebook. Nachrichten werden standardmäßig Ende-zu-Ende-verschlüsselt.',
  //   code: 'com.whatsapp',
  // ),
  // 'com.facebook.orca': App(
  //   title: 'Messenger',
  //   description:
  //       'Ein Messenger von Facebook. Nachrichten werden standardmäßig Ende-zu-Ende-verschlüsselt.',
  //   code: 'com.facebook.orca',
  // ),
  // 'com.discord': App(
  //   title: 'Discord',
  //   description:
  //       'Ein Messenger für Gamer. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
  //   code: 'com.discord',
  // ),
  // 'org.thoughtcrime.securesms': App(
  //   title: 'Signal',
  //   description:
  //       'Ein quelloffener Messenger. Nachrichten werden standardmäßig Ende-zu-Ende-verschlüsselt.',
  //   code: 'com.signalapp',
  // ),
  // 'com.skype.raider': App(
  //   title: 'Skype',
  //   description:
  //       'Ein Messenger von Microsoft. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
  //   code: 'com.skype.raider',
  // ),
  // 'com.snapchat.android': App(
  //   title: 'Snapchat',
  //   description:
  //       'Ein Messenger, der sich auf Bilder und Videos spezialisiert hat. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
  //   code: 'com.snapchat.android',
  // ),
  // 'com.google.android.apps.messaging': App(
  //   title: 'Messages',
  //   description:
  //       'Der Standard-Messenger auf Android-Geräten. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
  //   code: 'com.google.android.apps.messaging',
  // ),
  // 'com.google.android.apps.meetings': App(
  //   title: 'Google Meet',
  //   description:
  //       'Ein Messenger von Google. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
  //   code: 'com.google.android.apps.meetings',
  // ),
  // 'com.google.android.apps.tachyon': App(
  //   title: 'Google Duo',
  //   description:
  //       'Ein Messenger von Google. Nachrichten werden standardmäßig nicht Ende-zu-Ende-verschlüsselt.',
  //   code: 'com.google.android.apps.tachyon',
  // ),
  // 'im.vector.app': App(
  //   title: 'Element',
  //   description:
  //       'Ein quelloffener Messenger, der auf dem Matrix-Protokoll basiert und standardmäßig Ende-zu-Ende-verschlüsselt ist.',
  //   code: 'im.vector.app',
  // ),
  Alternative(
    app: APPS['im.vector.app']!, // Element
    replacing: [
      APPS['com.whatsapp']!,
      APPS['com.facebook.orca']!,
      APPS['com.discord']!,
      APPS['org.telegram.messenger']!,
      APPS['com.skype.raider']!,
      APPS['com.snapchat.android']!,
      APPS['com.google.android.apps.meetings']!,
      APPS['com.google.android.apps.tachyon']!,
    ],
    goodOtherApps: [
      APPS['org.thoughtcrime.securesms']!, // Signal
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
  alternatives.addAll(alternative.goodOtherApps);

  // Remove the app itself
  alternatives.remove(app);

  return alternatives;
}

getInstalledGoodApps() {
  List<App> goodApps = [];
  InstalledAppsService.installedApps.forEach((appInfo) {
    App? app = null;
    APPS.forEach((key, value) {
      if (appInfo.packageName == key) {
        app = value;
        app!.icon = appInfo.icon!;
      }
    });
    if (app != null && isAppGood(app!)) {
      goodApps.add(app!);
    }
    // goodApps.add(convertAppInfoToApp(appInfo));
  });
  return goodApps;
}

getInstalledBadApps() {
  List<App> badApps = [];
  InstalledAppsService.installedApps.forEach((appInfo) {
    App? app = null;
    APPS.forEach((key, value) {
      if (appInfo.packageName == key) {
        app = value;
        app!.icon = appInfo.icon!;
      }
    });
    if (app != null && !isAppGood(app!)) {
      badApps.add(app!);
    }
  });
  return badApps;
}

convertAppInfoToApp(AppInfo appInfo) {
  App? app = null;
  APPS.forEach((key, value) {
    if (appInfo.packageName == key) {
      app = value;
      app!.icon = appInfo.icon!;
    }
  });

  if (app == null) {
    return App(
      title: appInfo.name,
      description: 'Keine Beschreibung verfügbar',
      code: appInfo.packageName,
    );
  }
  return app;
}
