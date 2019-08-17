import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:rpggame/rpggame.dart';

class Backyard {
  final MyGame game;
  Sprite bgSprite;
  Rect bgRect;

  Backyard(this.game) {
    bgSprite = Sprite('bg/tiles-map.png');
    bgRect = Rect.fromLTWH(0, game.screenSize.height - (game.tileSize * 8),
        game.tileSize * 16, game.tileSize * 8);
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
