import 'package:cara_ou_coroa_gigachad_edition/core/storage/shared_preferences/shared_preferences_keys.dart';
import 'package:cara_ou_coroa_gigachad_edition/core/storage/shared_preferences/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class SettingsService {
  final SharedPreferencesService _sharedPreferencesService = SharedPreferencesService();

  Future<int?> getTheme() => _sharedPreferencesService.getInt(SharedPreferencesKeys.selectedTheme);

  Future<bool> setTheme(ThemeMode theme) =>
      _sharedPreferencesService.setInt(SharedPreferencesKeys.selectedTheme, theme.index);

  Future<bool?> getAudioEnabled() => _sharedPreferencesService.getBool(SharedPreferencesKeys.audioEnabled);

  Future<bool> setAudioEnabled(bool audioEnabled) =>
      _sharedPreferencesService.setBool(SharedPreferencesKeys.audioEnabled, audioEnabled);
}
