// reducer.dart
import 'package:redux/redux.dart';
import 'state.dart';
import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is UpdateResultAction) {
    return state.copyWith(result: action.result);
  }
  return state;
}
