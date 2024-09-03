import 'package:redux/redux.dart';
import 'state.dart';
import 'reducer.dart';


  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
  );

