import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';

class SettingsService {
  static final _box = Hive.box<bool>(kUserSettings);

  // Store theme preference
  static saveThemeMode(bool isDarkMode) {
    _box.put('isDarkMode', isDarkMode);
  }

  // Retrieve theme preference
  static bool? loadThemeMode() {
    return _box.get('isDarkMode',
        defaultValue: false); // default to light mode (false)
  }
}
