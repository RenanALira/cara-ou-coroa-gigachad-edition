import 'package:cara_ou_coroa_gigachad_edition/features/coin/viewmodel/coin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreBoardWidget extends StatelessWidget {
  const ScoreBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scoreStyle = Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold);
    final labelStyle = Theme.of(context).textTheme.labelLarge;

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 50,
              children: [
                Expanded(
                  child: Text('Cara', textAlign: TextAlign.right, style: labelStyle),
                ),
                Expanded(child: Text('Coroa', style: labelStyle)),
              ],
            ),
            Selector<CoinViewModel, (int, int)>(
              selector: (_, coinViewmodel) => (coinViewmodel.headsScore, coinViewmodel.tailsScore),
              builder: (_, scores, _) {
                final (heads, tails) = scores;
                return Row(
                  children: [
                    Expanded(
                      child: Text(heads.toString(), textAlign: TextAlign.right, style: scoreStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text('x', style: scoreStyle),
                    ),
                    Expanded(child: Text(tails.toString(), style: scoreStyle)),
                  ],
                );
              },
            ),
            IconButton(
              onPressed: () => context.read<CoinViewModel>().resetScore(),
              icon: const Icon(Icons.replay_outlined),
              tooltip: 'Reiniciar pontuação',
            ),
          ],
        ),
      ),
    );
  }
}
