import 'package:cara_ou_coroa_gigachad_edition/features/settings/viewmodel/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Tema'),
        Selector<SettingsViewmodel, ThemeMode>(
          selector: (context, settingsViewModel) => settingsViewModel.activeTheme,
          builder: (context, activeTheme, child) {
            final settingsViewmodel = context.read<SettingsViewmodel>();

            return SegmentedButton(
              showSelectedIcon: false,
              segments: [
                const ButtonSegment(
                  value: ThemeMode.system,
                  icon: Icon(Icons.phone_android_outlined),
                  label: Text('Sistema'),
                ),
                const ButtonSegment(
                  value: ThemeMode.light,
                  icon: Icon(Icons.light_mode_outlined),
                  label: Text('Claro'),
                ),
                const ButtonSegment(value: ThemeMode.dark, icon: Icon(Icons.dark_mode_outlined), label: Text('Escuro')),
              ],
              selected: {activeTheme},
              onSelectionChanged: (Set<ThemeMode> selectedTheme) {
                settingsViewmodel.setTheme(selectedTheme.first);
              },
            );
          },
        ),
      ],
    );
  }
}
