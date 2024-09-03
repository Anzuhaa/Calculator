
// ignore_for_file: depend_on_referenced_packages

import 'package:calculator_redux/reducer.dart';
import 'package:redux/redux.dart';
import 'state.dart';


final Store<BentukState> store = Store<BentukState>(
  shapeReducer,
  initialState: BentukState.initialState(),
);
