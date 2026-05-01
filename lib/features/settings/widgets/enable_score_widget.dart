import 'package:cara_ou_coroa_gigachad_edition/features/settings/viewmodel/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnableScoreWidget extends StatelessWidget {
  const EnableScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SettingsViewmodel, bool>(
      selector: (context, settingsViewModel) => settingsViewModel.scoreEnabled,
      builder: (context, scoreEnabled, child) {
        final settingsViewmodel = context.read<SettingsViewmodel>();

        return SwitchListTile(
          title: Text('Habilitar pontuação'),
          subtitle: Text('Escolha exibir ou não o placar.'),
          secondary: Icon(Icons.scoreboard_outlined),
          thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
            return states.contains(WidgetState.selected)
                ? const Icon(Icons.check_outlined)
                : const Icon(Icons.close_outlined);
          }),
          value: scoreEnabled,
          onChanged: (bool value) {
            settingsViewmodel.setScoreEnabled(value);
          },
        );
      },
    );
  }
}
