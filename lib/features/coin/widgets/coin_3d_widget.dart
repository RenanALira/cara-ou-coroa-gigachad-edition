import 'package:audioplayers/audioplayers.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/utils/constants/animation_name.dart';
import 'package:cara_ou_coroa_gigachad_edition/shared/contants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Coin3DWidget extends StatefulWidget {
  final AnimationName? currentAnimation;
  final void Function() onModelLoaded;
  final void Function() onAnimationCompleted;
  final bool audioEnabled;

  const Coin3DWidget({
    super.key,
    required this.currentAnimation,
    required this.onModelLoaded,
    required this.onAnimationCompleted,
    required this.audioEnabled,
  });

  @override
  State<Coin3DWidget> createState() => Coin3DWidgetState();
}

class Coin3DWidgetState extends State<Coin3DWidget> {
  late final Flutter3DController coinAnimationController;
  late final AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();

    coinAnimationController = Flutter3DController();

    audioPlayer = AudioPlayer(playerId: 'coin_flip_player');
    audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    super.dispose();

    audioPlayer.dispose();
  }

  @override
  void didUpdateWidget(covariant Coin3DWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.currentAnimation?.value != null) {
      _playAnimation();
    }
  }

  void _playAnimation() {
    coinAnimationController.resetCameraOrbit();
    coinAnimationController.setCameraTarget(0, 0, 0.01);

    Future.delayed(Duration(milliseconds: 300)).then((_) {
      coinAnimationController.playAnimation(animationName: widget.currentAnimation?.value, loopCount: 1);

      if (widget.audioEnabled) {
        audioPlayer.play(AssetSource('audios/coin_flip.mp3'));
      }

      Future.delayed(Duration(seconds: 1, milliseconds: 300)).then((_) {
        resetCamera();

        widget.onAnimationCompleted();
      });
    });
  }

  void resetCamera() {
    coinAnimationController.resetCameraTarget();
    coinAnimationController.resetCameraOrbit();
  }

  @override
  Widget build(BuildContext context) {
    return Flutter3DViewer(
      src: 'assets/3d_models/um_real.glb',
      controller: coinAnimationController,
      onLoad: (_) => widget.onModelLoaded(),
      progressBarColor: ColorPalette.golden,
    );
  }
}
