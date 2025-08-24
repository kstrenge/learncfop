import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _preferences;

  /// Gets the shared preferences instance. Call at startup.
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Checks if it is the first time the user started the app.
  static Future<bool> isFirstLaunch() async {
    assert(_preferences != null, "call init() first");
    return _preferences!.getBool("isFirstStart") ?? true;
  }

  /// Marks that the app was launched before and is initialized.
  static Future<bool> markAsLaunchedBefore() async {
    assert(_preferences != null, "call init() first");
    return _preferences!.setBool("isFirstStart", false);
  }

  /// Loads the chosen username from storage.
  static Future<String> loadUsername() async {
    assert(_preferences != null, "call init() first");
    return _preferences!.getString("username") ?? "";
  }

  /// Saves the chosen username to storage.
  static Future<void> saveUsername(String? value) async {
    assert(_preferences != null, "call init() first");
    await _preferences!.setString("username", value ?? "");
  }
}
