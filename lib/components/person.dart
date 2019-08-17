import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:rpggame/rpggame.dart';

class Person {
  final MyGame game;
  Rect personRect;
  bool isDead = false;
  bool isOffScreen = false;
  double walkingSpriteIndex = 0;
  List<Sprite> walkingSprite;

  Person(this.game, double x, double y) {
    personRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    walkingSprite = List<Sprite>();
    walkingSprite.add(Sprite('chars/Fumiko1.png'));
    walkingSprite.add(Sprite('chars/Fumiko3.png'));
  }

  void render(Canvas c) {
    // bgSprite.renderRect(c, personRect);
    walkingSprite[walkingSpriteIndex.toInt()]
        .renderRect(c, personRect.inflate(2));
  }

  void update(double t) {
    if (isDead) {
      personRect = personRect.translate(0, game.tileSize * 2 * t);
      walkingSpriteIndex += 6 * t;
      if (walkingSpriteIndex >= 2) 
      {
        walkingSpriteIndex -= 2;
      }

      if (personRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    }
  }

  void onTapDown() {
    isDead = true;
    game.spawnPerson();
  }
}
