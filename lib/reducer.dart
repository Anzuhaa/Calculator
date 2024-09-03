import 'package:calculator_redux/action.dart';
import 'state.dart';

BentukState shapeReducer(BentukState state, dynamic action) {
  if (action is CalculateBalokKelilingAction) {
    final keliling = 4 * (action.panjang + action.lebar + action.tinggi);
    return BentukState(keliling: keliling);
  } else if (action is CalculateKubusKelilingAction) {
    final keliling = 12 * action.sisi;
    return BentukState(keliling: keliling);
  } else if (action is CalculateTabungKelilingAction) {
    final keliling = 2 * (3.14 * action.jariJari + action.tinggi);
    return BentukState(keliling: keliling);
  }

  return state;
}
