import 'package:cara_ou_coroa_gigachad_edition/features/settings/service/settings_service.dart';
import 'package:flutter/material.dart';

class SettingsViewmodel extends ChangeNotifier {
  final SettingsService _settingsService = SettingsService();
  ThemeMode _activeTheme;

  SettingsViewmodel({required ThemeMode activeTheme}) : _activeTheme = activeTheme;

  ThemeMode get activeTheme => _activeTheme;

  Future<bool> setTheme(ThemeMode themeMode) async {
    _activeTheme = themeMode;
    notifyListeners();

    return await _settingsService.setTheme(themeMode);
  }
}
