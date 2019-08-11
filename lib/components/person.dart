import 'dart:ui';
import 'package:rpggame/rpggame.dart';

class Person {
  final MyGame game;
  Rect personRect;
  Paint personPaint;
  bool isDead = false;
  bool isOffScreen = false;

  Person(this.game, double x, double y) {
    personRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    personPaint = Paint();
  }

  void render(Canvas c) {
    c.drawRect(personRect, personPaint);
  }

  void update(double t) {
    if (isDead) {
      personRect = personRect.translate(0, game.tileSize * 1 * t);
    }

    if(personRect.top > game.screenSize.height) {
      isOffScreen = true;
    }
  }

  void onTapDown() {
    isDead = true;
    personPaint.color = Color(0xffff4757);
    game.spawnPerson();
  }
}
