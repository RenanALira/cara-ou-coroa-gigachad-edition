import 'package:cara_ou_coroa_gigachad_edition/features/coin/viewmodel/coin_viewmodel.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/widgets/coin_3d_flippable_widget.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/widgets/info_icon_text_widget.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/settings/viewmodel/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinFlipModeWidget extends StatelessWidget {
  const CoinFlipModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InfoIconTextWidget(icon: Icons.swipe_up_outlined, text: 'Deslize para cima para girar.'),
        Selector<CoinViewModel, int>(
          selector: (context, coinViewModel) => coinViewModel.flipCount,
          builder: (context, flipCount, child) {
            final coinViewModel = context.read<CoinViewModel>();
            final settingsViewModel = context.read<SettingsViewmodel>();

            return Coin3DFlippableWidget(
              currentAnimation: coinViewModel.currentAnimation,
              onModelLoaded: coinViewModel.onModelLoaded,
              onAnimationCompleted: coinViewModel.onAnimationCompleted,
              audioEnabled: settingsViewModel.audioEnabled,
            );
          },
        ),
        Selector<CoinViewModel, (bool, bool)>(
          selector: (_, coinViewModel) => (coinViewModel.coin3DModelIsLoaded, coinViewModel.isSpinning),
          builder: (_, options, child) {
            final (isLoaded, isSpinning) = options;

            return GestureDetector(
              onVerticalDragUpdate: !isLoaded || isSpinning
                  ? null
                  : (gestureDetails) {
                      if (gestureDetails.delta.dy <= -30) {
                        context.read<CoinViewModel>().spin();
                      }
                    },
              child: child,
            );
          },
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}
