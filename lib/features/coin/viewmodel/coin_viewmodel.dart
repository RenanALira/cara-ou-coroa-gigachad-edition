import 'package:cara_ou_coroa_gigachad_edition/core/helpers/random_helper.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/utils/constants/animation_name.dart';
import 'package:flutter/material.dart';

class CoinViewModel extends ChangeNotifier {
  bool _coin3DModelIsLoaded = false;
  bool _isSpinning = false;
  bool _headsIsUp = true;
  AnimationName? _currentAnimation;
  int _flipCount = 0;

  CoinViewModel();

  bool get coin3DModelIsLoaded => _coin3DModelIsLoaded;
  bool get isSpinning => _isSpinning;
  AnimationName? get currentAnimation => _currentAnimation;
  int get flipCount => _flipCount;

  void spin() {
    if (_isSpinning) return;

    _isSpinning = true;
    notifyListeners();

    final bool isRandomNumberEven = RandomHelper.getRandomNumber(999).isEven;

    if (_headsIsUp) {
      _currentAnimation = isRandomNumberEven ? AnimationName.headsToHeads : AnimationName.headsToTails;
    } else {
      _currentAnimation = isRandomNumberEven ? AnimationName.tailsToTails : AnimationName.tailsToHeads;
    }

    _flipCount++;
    notifyListeners();
  }

  void onModelLoaded() {
    _coin3DModelIsLoaded = true;
    notifyListeners();
  }

  void onAnimationCompleted() {
    if ([AnimationName.headsToTails, AnimationName.tailsToHeads].contains(_currentAnimation)) {
      _headsIsUp = !_headsIsUp;
    }

    _isSpinning = false;
    notifyListeners();
  }
}
