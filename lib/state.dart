// lib/state.dart
class AppState {
  final double base;
  final double exponent;
  final double result;

  AppState({this.base = 0.0, this.exponent = 0.0, this.result = 1.0});

  AppState copyWith({double? base, double? exponent, double? result}) {
    return AppState(
      base: base ?? this.base,
      exponent: exponent ?? this.exponent,
      result: result ?? this.result,
    );
  }
}
