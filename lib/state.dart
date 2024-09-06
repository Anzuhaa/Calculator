// app_state.dart
class AppState {
  final int result;

  AppState({required this.result});

  AppState.initial() : result = 0;

  AppState copyWith({int? result}) {
    return AppState(
      result: result ?? this.result,
    );
  }
}
