import 'package:cara_ou_coroa_gigachad_edition/features/settings/service/settings_service.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/settings/view/settings_view.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/settings/viewmodel/settings_viewmodel.dart';
import 'package:cara_ou_coroa_gigachad_edition/shared/contants/routes.dart';
import 'package:cara_ou_coroa_gigachad_edition/shared/custom_themes/custom_theme.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/viewmodel/coin_viewmodel.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/view/coin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final SettingsService settingsService = SettingsService();
  final int? storedThemeIndex = await settingsService.getTheme();
  final initialTheme = storedThemeIndex != null ? ThemeMode.values[storedThemeIndex] : ThemeMode.system;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsViewmodel>(create: (_) => SettingsViewmodel(activeTheme: initialTheme)),
        ChangeNotifierProvider<CoinViewModel>(create: (_) => CoinViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsViewmodel>(
      builder: (context, settingsViewModel, _) {
        return MaterialApp(
          title: "Cara ou Coroa: Gigachad Edition",
          themeMode: settingsViewModel.activeTheme,
          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          initialRoute: Routes.home,
          routes: {Routes.home: (context) => const CoinView(), Routes.settings: (context) => const SettingsView()},
        );
      },
    );
  }
}
