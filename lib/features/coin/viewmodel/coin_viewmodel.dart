import 'package:cara_ou_coroa_gigachad_edition/core/helpers/random_helper.dart';
import 'package:cara_ou_coroa_gigachad_edition/features/coin/utils/constants/animation_name.dart';
import 'package:flutter/material.dart';

class CoinViewModel extends ChangeNotifier {
  bool _coin3DModelIsLoaded = false;
  bool _isSpinning = false;
  bool _headsIsUp = true;
  bool _isFlipMode = true;
  AnimationName? _currentAnimation;
  int _flipCount = 0;
  int _headsScore = 0;
  int _tailsScore = 0;

  CoinViewModel();

  bool get coin3DModelIsLoaded => _coin3DModelIsLoaded;
  bool get isSpinning => _isSpinning;
  bool get isFlipMode => _isFlipMode;
  AnimationName? get currentAnimation => _currentAnimation;
  int get flipCount => _flipCount;
  int get headsScore => _headsScore;
  int get tailsScore => _tailsScore;

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

    if (_headsIsUp) {
      _headsScore++;
    } else {
      _tailsScore++;
    }

    _isSpinning = false;
    notifyListeners();
  }

  void resetScore() {
    _headsScore = 0;
    _tailsScore = 0;

    notifyListeners();
  }

  void toggleFlipMode() {
    _coin3DModelIsLoaded = false;
    _headsIsUp = true;
    _isFlipMode = !_isFlipMode;

    notifyListeners();
  }
}
