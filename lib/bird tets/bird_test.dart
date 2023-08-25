// ignore_for_file: avoid_print

import 'bird.dart';

birdTest() {
  print('bird test');
  //erstelle 2 bird objekte/instanzen

  //print die color (instanzvariable) von dem jeweiligen bird in dem
  // du auf die member variable zugreifst

  final taube = Bird('bunt');
  final letter = taube.getSecondLetterOfColor();
  print(letter);

  final ente = Bird('gruen');
  final schwan = Bird('weiss');
  print(ente.color);
  print(schwan.color);
}
