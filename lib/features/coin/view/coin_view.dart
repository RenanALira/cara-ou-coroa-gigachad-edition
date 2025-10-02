import 'package:cara_ou_coroa_gigachad_edition/features/coin/viewmodel/coin_viewmodel.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/widget/coin_3d_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinView extends StatefulWidget {
  const CoinView({super.key});

  @override
  State<CoinView> createState() => _CoinViewState();
}

class _CoinViewState extends State<CoinView> {
  final GlobalKey<Coin3DWidgetState> coinKey = GlobalKey<Coin3DWidgetState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Cara ou Coroa: Gigachad Edition')),
        body: Selector<CoinViewModel, int>(
          selector: (context, coinViewModel) => coinViewModel.flipCount,
          builder: (context, properties, child) {
            final coinViewModel = Provider.of<CoinViewModel>(context, listen: false);

            return Coin3DWidget(
              key: coinKey,
              currentAnimation: coinViewModel.currentAnimation,
              onModelLoaded: coinViewModel.onModelLoaded,
              onAnimationCompleted: coinViewModel.onAnimationCompleted,
            );
          },
        ),
        floatingActionButton: Consumer<CoinViewModel>(
          builder: (context, coinViewModel, child) {
            return Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    fixedSize: Size(200, 50),
                    iconSize: 30,
                    textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  onPressed: !coinViewModel.coin3DModelIsLoaded || coinViewModel.isSpinning
                      ? null
                      : () => coinViewModel.spin(),
                  label: Text('Girar'.toUpperCase()),
                  icon: Icon(Icons.autorenew_outlined),
                ),
                TextButton.icon(
                  style: FilledButton.styleFrom(fixedSize: Size(200, 25)),
                  onPressed: !coinViewModel.coin3DModelIsLoaded || coinViewModel.isSpinning
                      ? null
                      : () => coinKey.currentState?.resetCamera(),
                  label: Text('Centralizar câmera'),
                  icon: Icon(Icons.center_focus_weak_outlined),
                ),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
