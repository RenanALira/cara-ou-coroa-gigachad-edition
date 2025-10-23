import 'package:cara_ou_coroa_gigachad_edition/features/settings/service/settings_service.dart';
import 'package:flutter/material.dart';

class SettingsViewmodel extends ChangeNotifier {
  final SettingsService _settingsService = SettingsService();
  ThemeMode _activeTheme;
  bool _audioEnabled = true;

  SettingsViewmodel({required ThemeMode activeTheme}) : _activeTheme = activeTheme {
    _settingsService.getAudioEnabled().then((audioEnabled) => _audioEnabled = audioEnabled ?? true);
  }

  ThemeMode get activeTheme => _activeTheme;

  Future<bool> setTheme(ThemeMode themeMode) async {
    _activeTheme = themeMode;
    notifyListeners();

    return await _settingsService.setTheme(themeMode);
  }

  bool get audioEnabled => _audioEnabled;

  Future<bool> setAudioEnabled(bool audioEnabled) async {
    _audioEnabled = audioEnabled;
    notifyListeners();

    return await _settingsService.setAudioEnabled(audioEnabled);
  }
}
