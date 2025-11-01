import 'package:cara_ou_coroa_gigachad_edition/shared/contants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Coin3DViewerWidget extends StatelessWidget {
  final bool isTouchable;
  final Flutter3DController? coinAnimationController;
  final void Function()? onModelLoaded;
  const Coin3DViewerWidget({super.key, this.isTouchable = false, this.coinAnimationController, this.onModelLoaded});

  @override
  Widget build(BuildContext context) {
    return Flutter3DViewer(
      src: 'assets/3d_models/um_real.glb',
      enableTouch: isTouchable,
      controller: coinAnimationController,
      onLoad: onModelLoaded != null ? (_) => onModelLoaded!() : null,
      progressBarColor: ColorPalette.golden,
    );
  }
}
