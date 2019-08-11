import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:rpggame/components/person.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:rpggame/components/backyard.dart';

class MyGame extends Game {
  Size screenSize;
  double tileSize;
  List<Person> persons;
  Random rnd;
  Backyard background;

  MyGame() {
    initialize();
  }

  void initialize() async {
    persons = List<Person>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    background = Backyard(this);
    spawnPerson();
  }

  void spawnPerson() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    persons.add(Person(this, x, y));
  }

  void render(Canvas canvas) {
    background.render(canvas);

    persons.forEach((Person person) => person.render(canvas));
  }

  void onTapDown(TapDownDetails d) {
    persons.forEach((Person person) {
      if (person.personRect.contains(d.globalPosition)) {
        person.onTapDown();
      }
    });
  }

  void update(double t) {
    persons.forEach((Person person) => person.update(t));
    persons.removeWhere((Person person) => person.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    // for screens 16:9 or 16:x
    tileSize = screenSize.width / 16;
  }
}
