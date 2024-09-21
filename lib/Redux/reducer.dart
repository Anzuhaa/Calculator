import 'package:calculator_redux/Redux/state.dart';

import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetRouteAction) {
    return AppState(currentRoute: action.newRoute, value: 0);
  } else if (action is CalculateSquareValue) {
    final result = 4 * action.side;
    return AppState(value: result, currentRoute: '/PersegiPage');
  } else if (action is CalculateRectangleValue) {
    final result = 2 * (action.length + action.width);
    return AppState(value: result, currentRoute: '/PersegiPanjangPage');
  } else if (action is CalculateTriangleValue) {
    final result = action.side1 + action.side2 + action.side3;
    return AppState(value: result, currentRoute: '/SegitigaPage');
  } else if (action is CalculateAritmatik) {
    return AppState(currentRoute: '/AritmatikPage', value: action.value);
  } else if (action is CalculateBoxValue) {
    final result = 4 * (action.panjang + action.lebar + action.tinggi);
    return AppState(value: result, currentRoute: '/BalokPage');
  } else if (action is CalculateCubeValue) {
    final result = 12 * action.sisi;
    return AppState(value: result, currentRoute: '/KubusPage');
  } else if (action is CalculateTubeValue) {
    final result = 2 * (3.14 * action.jariJari + action.tinggi);
    return AppState(value: result, currentRoute: '/TabungPage');
  } else if (action is CalculatePerpangkatan) {
    return AppState(value: action.value, currentRoute: '/PerpangkatanPage');
  } else if (action is resetCalculateValue) {
    return AppState(currentRoute: '/PersegiPage', value: 0);
  }
  return state;
}
