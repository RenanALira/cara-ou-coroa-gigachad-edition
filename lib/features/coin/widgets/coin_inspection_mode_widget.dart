import 'package:cara_ou_coroa_gigachad_edition/features/coin/widgets/coin_3d_viewer_widget.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/widgets/info_icon_text_widget.dart';
import 'package:flutter/material.dart';

class CoinInspectionModeWidget extends StatelessWidget {
  const CoinInspectionModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InfoIconTextWidget(icon: Icons.swipe_outlined, text: 'Admire a sublime Chadcoin.'),
        Coin3DViewerWidget(isTouchable: true),
      ],
    );
  }
}
