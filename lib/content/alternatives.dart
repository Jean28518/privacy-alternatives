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
      APPS['ch.threema.app']!, // Signal
    ],
  ),
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
    print('Checking alternatives for ${app.title}');
    List<App> alternatives = getAlternativesTo(app);
    if (alternatives.isNotEmpty) {
      // Check if another good alternative is already installed
      bool goodAlternativeInstalled = false;
      for (App alternative in alternatives) {
        if (getInstalledGoodApps().contains(alternative)) {
          goodAlternativeInstalled = true;
        }
      }
      if (goodAlternativeInstalled) {
        continue;
      } else {
        recommendedAlternatives.add((app, alternatives.first));
      }
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
