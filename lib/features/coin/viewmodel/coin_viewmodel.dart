import 'package:cara_ou_coroa_gigachad_edition/core/helpers/random_helper.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/utils/constants/animation_name.dart';
import 'package:flutter/material.dart';

class CoinViewModel extends ChangeNotifier {
  CoinViewModel();

  bool coin3DModelIsLoaded = false;
  bool isSpinning = false;
  bool headsIsUp = true;
  AnimationName? currentAnimation;
  int flipCount = 0;

  void spin() {
    if (isSpinning) return;

    isSpinning = true;
    notifyListeners();

    final bool isRandomNumberEven = RandomHelper.getRandomNumber(999).isEven;

    if (headsIsUp) {
      currentAnimation = isRandomNumberEven ? AnimationName.headsToHeads : AnimationName.headsToTails;
    } else {
      currentAnimation = isRandomNumberEven ? AnimationName.tailsToTails : AnimationName.tailsToHeads;
    }

    flipCount++;
    notifyListeners();
  }

  void onModelLoaded() {
    coin3DModelIsLoaded = true;
    notifyListeners();
  }

  void onAnimationCompleted() {
    if ([AnimationName.headsToTails, AnimationName.tailsToHeads].contains(currentAnimation)) {
      headsIsUp = !headsIsUp;
    }

    isSpinning = false;
    notifyListeners();
  }
}
