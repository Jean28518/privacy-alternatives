import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

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
    return apps;
  }
}
