import 'package:flutter/material.dart';

class Bird {
  final String _color;
  String get color => _color;

  Bird(this._color) {
    // ignore: avoid_print
    print('bird erstellt: $_color');
  }

  String getSecondLetterOfColor() {
    return _color.characters.elementAt(1);
  }

  void sing() {
    // ignore: avoid_print
    print('$_color --- sing sing');
  }

  void poo() {
    sing();
    // ignore: avoid_print
    print('$_color ---  poo');
  }
}

class Beziehung {
  final String definition;

  Beziehung(this.definition) {
    // ignore: avoid_print
    print('Beziehung wird erstellt');
  }

  void wasSindwir() {
    // ignore: avoid_print
    print('Wir sind in einer $definition Beziehung');
  }
}
