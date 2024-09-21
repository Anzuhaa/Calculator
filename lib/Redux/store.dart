import 'package:calculator_redux/Redux/state.dart';
import 'package:redux/redux.dart';
import 'reducer.dart';

Store<AppState> createStore() {
  return Store<AppState>(appReducer,
      initialState: AppState(value: 0, currentRoute: '/'));
}
