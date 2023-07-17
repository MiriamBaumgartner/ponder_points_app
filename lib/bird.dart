class Bird {
  final String color;

  Bird(this.color) {
    print('bird erstellt: $color');
  }

  void sing() {
    print('$color --- sing sing');
  }

  void poo() {
    sing();

    print('$color ---  poo');
  }
}

class Beziehung {
  final String definition;

  Beziehung(this.definition) {
    print('Beziehung wird erstellt');
  }

  void wasSindwir() {
    print('Wir sind in einer $definition Beziehung');
  }
}
