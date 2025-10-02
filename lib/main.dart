import 'package:cara_ou_coroa_gigachad_edition/shared/custom_themes/custom_theme.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/viewmodel/coin_viewmodel.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/view/coin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider<CoinViewModel>(create: (_) => CoinViewModel())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cara ou Coroa: Gigachad Edition",
      themeMode: ThemeMode.system,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      home: const CoinView(),
    );
  }
}
