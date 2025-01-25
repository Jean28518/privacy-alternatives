import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class InstalledAppsService {
  static List<AppInfo> installedApps = [];

  static Future<List<AppInfo>> init() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(
      false,
      true,
    );
    installedApps = apps;
    return apps;
  }
}
