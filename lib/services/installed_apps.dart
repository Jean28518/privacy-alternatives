import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:android_package_manager/android_package_manager.dart';

final pm = AndroidPackageManager();

class InstalledAppsService {
  static List<AppInfo> installedApps = [];
  static List<String> systemApps = []; // List of package names

  static Future<List<AppInfo>> init() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(
      false,
      true,
    );
    for (var app in apps) {
      bool? isSystemApp = await InstalledApps.isSystemApp(app.packageName);
      if (isSystemApp == true) {
        systemApps.add(app.packageName);
      }
    }
    installedApps = apps;

    // Check in pm if the app is disabled
    List<AppInfo> apps_to_remove = [];
    for (var app in installedApps) {
      // If this fails, change the source dode of the package manager to return a int instead of a bool
      int? enabledSetting =
          await pm.getApplicationEnabledSetting(packageName: app.packageName);
      // Documentation on the constants: https://developer.android.com/reference/android/content/pm/PackageManager#getApplicationEnabledSetting(java.lang.String)
      if (enabledSetting != null &&
          (enabledSetting == 2 || enabledSetting == 3)) {
        print('App ${app.packageName} is disabled');
        apps_to_remove.add(app);
      }
    }

    for (var app in apps_to_remove) {
      installedApps.remove(app);
    }
    return apps;
  }
}
