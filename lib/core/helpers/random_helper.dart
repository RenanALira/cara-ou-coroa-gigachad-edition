import 'dart:math';

class RandomHelper {
  /// Returns a random int number between 0 and the given [max].
  static int getRandomNumber(int max) {
    return Random().nextInt(max);
  }
}
