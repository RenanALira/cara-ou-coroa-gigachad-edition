import 'package:cara_ou_coroa_gigachad_edition/features/settings/widgets/change_theme_widget.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/settings/widgets/enable_audio_widget.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(children: [ChangeThemeWidget(), Divider(height: 25), EnableAudioWidget()]),
      ),
    );
  }
}
