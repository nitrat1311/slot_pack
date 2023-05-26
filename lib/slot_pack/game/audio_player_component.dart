import 'package:audioplayers/audioplayers.dart';
import 'package:pilot_legend_avia/game/shooter_game.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:provider/provider.dart';

import '../models/settings.dart';

class AudioPlayerComponent extends Component with HasGameRef<RogueShooterGame> {
  AudioPlayer audio = AudioPlayer();
  @override
  Future<void>? onLoad() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.load('music.mp3');
    await audio.audioCache.loadAll([
      'audio/crack.mp3',
    ]);
    return super.onLoad();
  }

  void playBgm(String filename) {
    if (!FlameAudio.audioCache.loadedFiles.containsKey(filename)) return;

    if (gameRef.buildContext != null) {
      if (Provider.of<Settings>(gameRef.buildContext!, listen: false)
          .backgroundMusic) {
        FlameAudio.bgm.play(filename);
      }
    }
  }

  void playSfx(String filename) async {
    if (gameRef.buildContext != null) {
      if (Provider.of<Settings>(gameRef.buildContext!, listen: false)
          .soundEffects) {
        await audio.play(AssetSource(filename));
      }
    }
  }

  void stopBgm() {
    FlameAudio.bgm.stop();
  }
}
