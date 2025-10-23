import 'package:cara_ou_coroa_gigachad_edition/features/settings/viewmodel/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnableAudioWidget extends StatelessWidget {
  const EnableAudioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SettingsViewmodel, bool>(
      selector: (context, settingsViewModel) => settingsViewModel.audioEnabled,
      builder: (context, audioEnabled, child) {
        final settingsViewmodel = context.read<SettingsViewmodel>();

        return SwitchListTile(
          title: Text('Ativar áudio'),
          subtitle: Text('Escolha ativar ou não o som de giro.'),
          secondary: Icon(Icons.audiotrack_outlined),
          thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
            return states.contains(WidgetState.selected)
                ? const Icon(Icons.volume_up_outlined)
                : const Icon(Icons.volume_off_outlined);
          }),
          value: audioEnabled,
          onChanged: (bool value) {
            settingsViewmodel.setAudioEnabled(value);
          },
        );
      },
    );
  }
}
