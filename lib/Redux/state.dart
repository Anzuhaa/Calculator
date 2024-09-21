class AppState {
  final String currentRoute;
  final double value;

  AppState({
    required this.currentRoute,
    required this.value,
  });

  AppState.initialState(this.currentRoute) : value = 0.0;
  static initial() {}
}
