enum SoundEffect { coinFlip }

extension SoundEffectFileName on SoundEffect {
  String get value {
    switch (this) {
      case SoundEffect.coinFlip:
        return "coin_flip";
    }
  }
}
