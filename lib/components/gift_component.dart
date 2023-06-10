import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:gift_grab/components/santa_component.dart';
import 'package:gift_grab/constants/globals.dart';
import 'package:gift_grab/games/gift_grab_game.dart';
import 'dart:math';

class GiftComponent extends SpriteComponent
    with HasGameRef<GiftGrabGame>, CollisionCallbacks {
  /// Height of the sprite.
  final double _spriteHeight = Globals.isTablet ? 200.0 : 100.0;

  /// Used for generating random position of gift.
  final Random _random = Random();

  GiftComponent();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.giftSprite);

    position = _createRandomPosition();

    // Set dimensions of santa sprite.
    width = _spriteHeight;
    height = _spriteHeight;

    // Set anchor of component.
    anchor = Anchor.center;

    add(CircleHitbox()..radius = 1);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    // If collision comes from Santa...
    if (other is SantaComponent) {
      // Play gift grab sound.
      FlameAudio.play(Globals.itemGrabSound);

      // Remove the just collided gift.
      removeFromParent();

      // Update Santa's score by one.
      gameRef.score += 1;

      // Add a new gift to the field.
      gameRef.add(GiftComponent());
    }
  }

  /// Create new position for the gift on random.
  Vector2 _createRandomPosition() {
    final double x = _random.nextInt(gameRef.size.x.toInt()).toDouble();
    final double y = _random.nextInt(gameRef.size.y.toInt()).toDouble();

    return Vector2(x, y);
  }
}
