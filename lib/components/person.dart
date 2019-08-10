import 'dart:ui';
import 'package:rpggame/rpggame.dart';

class Person {
  final MyGame game;
  Rect personRect;
  Paint personPaint;

  Person(this.game, double x, double y) {
    personRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    personPaint = Paint();
    personPaint.color = Color(0x000000000);
  }

  void render(Canvas c) {
    c.drawRect(personRect, personPaint);
  }

  void update(double t) {}
}
