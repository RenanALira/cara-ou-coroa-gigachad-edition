enum AnimationName { headsToHeads, headsToTails, tailsToTails, tailsToHeads }

extension CoinAnimationName on AnimationName {
  String get value {
    switch (this) {
      case AnimationName.headsToHeads:
        return "Heads_to_Heads";
      case AnimationName.headsToTails:
        return "Heads_to_Tails";
      case AnimationName.tailsToHeads:
        return "Tails_to_Heads";
      case AnimationName.tailsToTails:
        return "Tails_to_Tails";
    }
  }
}
