import 'package:cara_ou_coroa_gigachad_edition/features/coin/viewmodel/coin_viewmodel.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/widgets/coin_inspection_mode_widget.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/widgets/coin_flip_mode_widget.dart';
import 'package:cara_ou_coroa_gigachad_edition/shared/contants/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinView extends StatefulWidget {
  const CoinView({super.key});

  @override
  State<CoinView> createState() => _CoinViewState();
}

class _CoinViewState extends State<CoinView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara ou Coroa: Gigachad Edition'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.settings);
            },
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: Selector<CoinViewModel, bool>(
        selector: (context, coinViewModel) => coinViewModel.isFlipMode,
        builder: (context, isFlipMode, child) {
          return isFlipMode ? CoinFlipModeWidget() : CoinInspectionModeWidget();
        },
      ),
      floatingActionButton: Consumer<CoinViewModel>(
        builder: (context, coinViewModel, child) {
          return FloatingActionButton(
            onPressed: () => coinViewModel.toggleFlipMode(),
            tooltip: "Modo de ${coinViewModel.isFlipMode ? 'inspeção' : 'giro'}",
            foregroundColor: Theme.of(context).colorScheme.surface,
            child: Icon(coinViewModel.isFlipMode ? Icons.swipe_outlined : Icons.swipe_up_outlined),
          );
        },
      ),
    );
  }
}
