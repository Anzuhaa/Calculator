import 'package:calculator_redux/Redux/state.dart';
import 'package:redux/redux.dart';
import 'reducer.dart';

Store<AppState> createStore() {
  return Store<AppState>(
    appReducer,
    initialState: AppState(currentRoute: '/'),
  );
}

final storeBangunDatar = Store<StateBangunDatar>(
  bangunDatarReducer,
  initialState: StateBangunDatar.initialState(),
);

final storeAritmatika = Store<StateAritmatik>(
  aritmatikReducer,
  initialState: StateAritmatik.initialState(),
);

final storeBangunRuang = Store<StateBangunRuang>(
  shapeReducer,
  initialState: StateBangunRuang.initialState(),
);

final storePerpangkatan = Store<StatePerpangkatan>(
  perpangkatanReducer,
  initialState: StatePerpangkatan.initialState(),
);
