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
  //   // E-Mail
  // 'com.google.android.gm': App(
  //   title: 'Gmail',
  //   description:
  //       'Ein E-Mail-Dienst von Google. Der Dienst sendet standardmäßig viele Daten an Google-Server.',
  //   code: 'com.google.android.gm',
  // ),
  // 'com.microsoft.office.outlook': App(
  //   title: 'Outlook',
  //   description:
  //       'Ein E-Mail-Dienst von Microsoft. Der Dienst sendet standardmäßig viele Daten an Microsoft-Server.',
  //   code: 'com.microsoft.office.outlook',
  // ),
  // 'com.yahoo.mobile.client.android.mail': App(
  //   title: 'Yahoo Mail',
  //   description:
  //       'Ein E-Mail-Dienst von Yahoo. Der Dienst sendet standardmäßig viele Daten an Yahoo-Server.',
  //   code: 'com.yahoo.mobile.client.android.mail',
  // ),
  // 'com.aol.mobile.aolapp': App(
  //   title: 'AOL Mail',
  //   description:
  //       'Ein E-Mail-Dienst von AOL. Der Dienst sendet standardmäßig viele Daten an AOL-Server.',
  //   code: 'com.aol.mobile.aolapp',
  // ),
  // 'de.tutao.tutanota': App(
  //   title: 'Tutanota',
  //   description:
  //       'Ein E-Mail-Dienst, der deine Privatsphäre respektiert und standardmäßig Ende-zu-Ende-verschlüsselt ist.',
  //   code: 'de.tutao.tutanota',
  // ),
  // 'com.k9.mail': App(
  //   title: 'K-9 Mail',
  //   description:
  //       'Ein quelloffener E-Mail-Client, der deine Privatsphäre respektiert.',
  //   code: 'com.k9.mail',
  // ),
  // 'com.fsck.k9': App(
  //   title: 'K-9 Mail',
  //   description:
  //       'Ein quelloffener E-Mail-Client, der deine Privatsphäre respektiert.',
  //   code: 'com.fsck.k9',
  // ),
  // 'ch.protonmail.android': App(
  //   title: 'ProtonMail',
  //   description:
  //       'Ein E-Mail-Dienst, der deine Privatsphäre respektiert und standardmäßig Ende-zu-Ende-verschlüsselt ist.',
  //   code: 'ch.protonmail.android',
  // ),
  // 'net.thunderbird.android': App(
  //   title: 'Thunderbird',
  //   description:
  //       'Ein quelloffener E-Mail-Client von Mozilla, der deine Privatsphäre respektiert.',
  //   code: 'org.mozilla.thunderbird',
  // ),
  // 'me.bluemail.mail': App(
  //   title: 'Blue Mail',
  //   description:
  //       'Ein E-Mail-Client, der mehrere E-Mail-Konten unterstützt und eine Vielzahl von Funktionen bietet. Der Dienst sendet standardmäßig viele Daten an Blue Mail-Server.',
  //   code: 'me.bluemail.mail',
  // ),
  Alternative(
    app: APPS['net.thunderbird.android']!, // Thunderbird
    replacing: [
      APPS['com.google.android.gm']!, // Gmail
      APPS['com.microsoft.office.outlook']!, // Outlook
      APPS['com.yahoo.mobile.client.android.mail']!, // Yahoo Mail
      APPS['com.aol.mobile.aolapp']!, // AOL Mail
      APPS['me.bluemail.mail']!, // Blue Mail
    ],
    goodOtherApps: [
      APPS['com.fsck.k9']!, // K-9 Mail
      APPS['ch.protonmail.android']!, // ProtonMail
      APPS['de.tutao.tutanota']! // Tutanota
    ],
  ),
  //   // ALL SOCIAL MEDIA
  // 'com.facebook.katana': App(
  //   title: 'Facebook',
  //   description:
  //       'Ein soziales Netzwerk von Facebook. Der Dienst sendet standardmäßig viele Daten an Facebook-Server.',
  //   code: 'com.facebook.katana',
  // ),
  // 'com.instagram.android': App(
  //   title: 'Instagram',
  //   description:
  //       'Ein soziales Netzwerk von Facebook. Der Dienst sendet standardmäßig viele Daten an Facebook-Server.',
  //   code: 'com.instagram.android',
  // ),
  // 'com.twitter.android': App(
  //   title: 'X (Twitter)',
  //   description: 'Ein soziales Netzwerk, das deine Privatsphäre respektiert.',
  //   code: 'com.twitter.android',
  // ),
  // 'com.instagram.barcelona': App(
  //   title: 'Threads',
  //   description:
  //       'Ein soziales Netzwerk von Facebook. Der Dienst sendet standardmäßig viele Daten an Facebook-Server.',
  //   code: 'com.instagram.barcelona',
  // ),
  // 'com.zhiliaoapp.musically': App(
  //   title: 'TikTok',
  //   description:
  //       'Ein soziales Netzwerk für das Teilen von kurzen Videos. Der Dienst sendet standardmäßig viele Daten an TikTok-Server.',
  //   code: 'com.zhiliaoapp.musically',
  // ),
  // 'org.joinmastodon.android': App(
  //   title: 'Mastodon',
  //   description:
  //       'Ein dezentrales soziales Netzwerk, das deine Privatsphäre respektiert und keine Daten an zentrale Server sendet.',
  //   code: 'org.joinmastodon.android',
  // ),
  // 'com.pixelfed': App(
  //   title: 'Pixelfed',
  //   description:
  //       'Ein dezentrales soziales Netzwerk für das Teilen von Fotos, das deine Privatsphäre respektiert und keine Daten an zentrale Server sendet.',
  //   code: 'com.pixelfed',
  // ),
  Alternative(
    app: APPS['com.pixelfed']!, // Pixelfed
    replacing: [
      APPS['com.instagram.android']!, // Instagram
    ],
    goodOtherApps: [
      APPS['org.joinmastodon.android']!, // Mastodon
    ],
  ),
  Alternative(
    app: APPS['org.joinmastodon.android']!, // Mastodon
    replacing: [
      APPS['com.twitter.android']!, // X (Twitter)
      APPS['com.instagram.barcelona']!, // Threads
    ],
    goodOtherApps: [
      APPS['com.pixelfed']!, // Pixelfed
    ],
  ),
  Alternative(
    app: APPS['org.joinmastodon.android']!,
    replacing: [
      APPS['com.zhiliaoapp.musically']!, // TikTok
      APPS['com.facebook.katana']!, // Facebook
    ],
    goodOtherApps: [
      APPS['com.pixelfed']!, // Pixelfed
    ],
  ),
];

bool isAppGood(App app) {
  return ALTERNATIVES.any((alternative) =>
      alternative.goodOtherApps.contains(app) || alternative.app == app);
}

List<App> getAlternativesTo(App app) {
  // Find the right alternative
  Alternative? alternative = null;
  ALTERNATIVES.forEach((alt) {
    if (alt.app == app) {
      alternative = alt;
    }
    if (alt.replacing.contains(app)) {
      alternative = alt;
    }
    if (alt.goodOtherApps.contains(app)) {
      alternative = alt;
    }
  });
  List<App> alternatives = [];
  alternatives.add(alternative!.app);
  alternatives.addAll(alternative!.goodOtherApps);

  // Remove the app itself
  alternatives.remove(app);

  return alternatives;
}

List<App> getInstalledGoodApps() {
  List<App> goodApps = [];
  InstalledAppsService.installedApps.forEach((appInfo) {
    App? app = null;
    APPS.forEach((key, value) {
      if (appInfo.packageName == key) {
        app = value;
        app!.icon = appInfo.icon!;
        app!.systemApp = InstalledAppsService.systemApps.contains(key);
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
        app!.systemApp = InstalledAppsService.systemApps.contains(key);
      }
    });
    if (app != null && !isAppGood(app!)) {
      badApps.add(app!);
    }
  });
  return badApps;
}

List<(App, App)> getRecommendedAlternatives() {
  List<(App, App)> recommendedAlternatives = [];
  List<App> installedBadApps = getInstalledBadApps();

  for (App app in installedBadApps) {
    List<App> alternatives = getAlternativesTo(app);
    if (alternatives.isNotEmpty &&
        !getInstalledGoodApps().contains(alternatives.first)) {
      recommendedAlternatives.add((app, alternatives.first));
    }
  }

  return recommendedAlternatives;
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

int getPrivacyScore() {
  List<App> goodApps = getInstalledGoodApps();
  List<App> badApps = getInstalledBadApps();

  int goodAppsNumber = goodApps.length;
  int badAppsNumber = badApps.length;
  // count the system apps inside the bad apps
  int badSystemAppsNumber = 0;
  for (App badApp in badApps) {
    if (badApp.systemApp) {
      badSystemAppsNumber++;
    }
  }

  // remove half of the system apps from the bad apps for the score.
  badAppsNumber -= badSystemAppsNumber ~/ 2;

  int score = 100 - (badAppsNumber * 100 ~/ (goodAppsNumber + badAppsNumber));
  return score;
}
