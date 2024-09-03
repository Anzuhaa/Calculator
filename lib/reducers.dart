import 'package:redux/redux.dart';
import 'actions.dart';
import 'state.dart';
import 'dart:math';

AppState appReducer(AppState state, dynamic action) {
  if (action is UpdateBaseAction) {
    return state.copyWith(base: action.base);
  } else if (action is UpdateExponentAction) {
    return state.copyWith(exponent: action.exponent);
  } else if (action is CalculatePowerAction) {
    final result = pow(state.base, state.exponent).toDouble();
    return state.copyWith(result: result);
  }

  return state;
}
