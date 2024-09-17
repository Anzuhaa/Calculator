class AppState {
  final String currentRoute;

  AppState({required this.currentRoute});
}

class StateBangunDatar {
  final double value;

  StateBangunDatar({required this.value});

  StateBangunDatar.initialState() : value = 0.0;

  static initial() {}
}

class StateAritmatik {
  final int result;

  StateAritmatik({required this.result});

  StateAritmatik.initialState() : result = 0;

  static initial() {}
}

class StateBangunRuang {
  final double value;

  StateBangunRuang({required this.value});

  StateBangunRuang.initialState() : value = 0.0;
}

class StatePerpangkatan {
  final int value;

  StatePerpangkatan({required this.value});

  StatePerpangkatan.initialState() : value = 0;
  static initial() {}
}
