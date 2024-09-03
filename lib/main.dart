import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart'; 
import 'store.dart';
import 'state.dart';
import 'actions.dart';

void main() {
  final store = createStore();
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: CalculatorPage(),
      ),
    );
  }
}

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Perpangkatan'),
      ),
      body: StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel(
          base: store.state.base,
          exponent: store.state.exponent,
          result: store.state.result,
          onBaseChanged: (value) => store.dispatch(UpdateBaseAction(value)),
          onExponentChanged: (value) => store.dispatch(UpdateExponentAction(value)),
          onCalculate: () => store.dispatch(CalculatePowerAction()),
        ),
        builder: (context, viewModel) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Angka'),
                  onChanged: (value) => viewModel.onBaseChanged(double.tryParse(value) ?? 0),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Pangkat'),
                  onChanged: (value) => viewModel.onExponentChanged(double.tryParse(value) ?? 0),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => viewModel.onCalculate(), 
                  child: Text('Calculate'),
                ),
                SizedBox(height: 20),
                Text('Result: ${viewModel.result}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ViewModel {
  final double base;
  final double exponent;
  final double result;
  final Function(double) onBaseChanged;
  final Function(double) onExponentChanged;
  final VoidCallback onCalculate; // Mengubah tipe menjadi VoidCallback

  _ViewModel({
    required this.base,
    required this.exponent,
    required this.result,
    required this.onBaseChanged,
    required this.onExponentChanged,
    required this.onCalculate,
  });
}
