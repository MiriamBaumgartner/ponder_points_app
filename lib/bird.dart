class Bird {
  final String color;

  Bird(this.color) {
    // ignore: avoid_print
    print('bird erstellt: $color');
  }

  void sing() {
    // ignore: avoid_print
    print('$color --- sing sing');
  }

  void poo() {
    sing();
    // ignore: avoid_print
    print('$color ---  poo');
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
