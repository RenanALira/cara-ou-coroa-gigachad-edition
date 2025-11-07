import 'package:audioplayers/audioplayers.dart';
import 'package:cara_ou_coroa_gigachad_edition/core/constants/sound_effect.dart';

class AudioService {
  static final AudioService instance = AudioService._internal();
  late final AudioPlayer _audioPlayer;
  bool _isPrewarmed = false;
  SoundEffect? _lastLoadedEffect;

  AudioService._internal() {
    _audioPlayer = AudioPlayer(playerId: 'main_audio_player');
  }

  Future<void> prewarm([SoundEffect soundEffect = SoundEffect.coinFlip]) async {
    if (_isPrewarmed && _lastLoadedEffect == soundEffect) return;

    await _loadSource(soundEffect);

    await _audioPlayer.setVolume(0);
    await _audioPlayer.resume();

    await Future.delayed(const Duration(milliseconds: 150));

    await _audioPlayer.stop();
    await _audioPlayer.setVolume(1);

    _isPrewarmed = true;
  }

  Future<void> _loadSource(SoundEffect soundEffect) async {
    String path = 'audios/${soundEffect.value}.mp3';

    await _audioPlayer.setSource(AssetSource(path));
    await _audioPlayer.setReleaseMode(ReleaseMode.stop);

    _lastLoadedEffect = soundEffect;
  }

  Future<void> playCoinFlip() async {
    _play(SoundEffect.coinFlip);
  }

  Future<void> _play(SoundEffect soundEffect) async {
    if (!_isPrewarmed || _lastLoadedEffect != soundEffect) {
      await prewarm(soundEffect);
    }

    await _audioPlayer.seek(Duration.zero);
    await _audioPlayer.resume();
  }
}
