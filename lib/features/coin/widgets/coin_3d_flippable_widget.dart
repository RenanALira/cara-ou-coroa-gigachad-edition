import 'package:audioplayers/audioplayers.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/utils/constants/animation_name.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/widgets/coin_3d_viewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Coin3DFlippableWidget extends StatefulWidget {
  final AnimationName? currentAnimation;
  final void Function() onModelLoaded;
  final void Function() onAnimationCompleted;
  final bool audioEnabled;

  const Coin3DFlippableWidget({
    super.key,
    this.currentAnimation,
    required this.onModelLoaded,
    required this.onAnimationCompleted,
    required this.audioEnabled,
  });

  @override
  State<Coin3DFlippableWidget> createState() => Coin3DFlippableWidgetState();
}

class Coin3DFlippableWidgetState extends State<Coin3DFlippableWidget> {
  final Flutter3DController coinAnimationController = Flutter3DController();
  final AudioPlayer audioPlayer = AudioPlayer(playerId: 'coin_flip_player');

  @override
  void initState() {
    super.initState();

    _initAudio();
  }

  @override
  void didUpdateWidget(covariant Coin3DFlippableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.currentAnimation?.value != null) {
      widget.audioEnabled ? _playWithAudio() : _playAnimation();
    }
  }

  @override
  void dispose() {
    super.dispose();

    audioPlayer.dispose();
  }

  void _initAudio() async {
    await audioPlayer.setSource(AssetSource('audios/coin_flip.mp3'));
    await audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  void _playWithAudio() async {
    await audioPlayer.seek(Duration.zero);
    audioPlayer.resume();

    _playAnimation();
  }

  void _playAnimation() {
    coinAnimationController.playAnimation(animationName: widget.currentAnimation?.value, loopCount: 1);

    Future.delayed(Duration(milliseconds: 900)).then((_) {
      widget.onAnimationCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Coin3DViewerWidget(
      coinAnimationController: coinAnimationController,
      onModelLoaded: () {
        widget.onModelLoaded();

        coinAnimationController.setCameraTarget(0, 0, 0.01);
      },
    );
  }
}
