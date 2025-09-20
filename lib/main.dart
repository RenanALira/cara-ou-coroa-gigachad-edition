import 'package:cara_ou_coroa_gigachad_edition/features/coin/viewmodel/coin_viewmodel.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/view/coin_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
    return MaterialApp(title: "Cara ou Coroa: Gigachad Edition", home: const CoinView());
  }
}
