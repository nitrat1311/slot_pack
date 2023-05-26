import 'package:flame/components.dart';

import '../../../../../test_of_pack/lib/slot_package/lib/const_colors.dart';

class ExplosionComponent extends SpriteAnimationComponent with HasGameRef {
  ExplosionComponent({super.position})
      : super(
          size: Vector2.all(50),
          anchor: Anchor.center,
          removeOnFinish: true,
        );

  @override
  Future<void> onLoad() async {
    animation = await gameRef.loadSpriteAnimation(
      'packages/${AppColors.myPackage}/assets/images/explosion.png',
      SpriteAnimationData.sequenced(
        stepTime: 0.1,
        amount: 6,
        textureSize: Vector2.all(32),
        loop: false,
      ),
    );
  }
}
