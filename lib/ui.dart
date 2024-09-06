// main.dart (continued)
// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'state.dart';
import 'actions.dart';

class uiDesign extends StatefulWidget {
  @override
  _uiDesignState createState() => _uiDesignState();
}

class _uiDesignState extends State<uiDesign> {
  final TextEditingController _inputController1 = TextEditingController();
  final TextEditingController _inputController2 = TextEditingController();
  String _operation = '+';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(store: store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Aritmatika'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _inputController1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'First Number'),
                ),
                TextField(
                  controller: _inputController2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Second Number'),
                ),
                DropdownButton<String>(
                  value: _operation,
                  items: <String>['+', '-', '*', '/', '%']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _operation = newValue!;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    final num1 = int.parse(_inputController1.text);
                    final num2 = int.parse(_inputController2.text);
                    int result;
                    switch (_operation) {
                      case '+':
                        result = num1 + num2;
                        break;
                      case '-':
                        result = num1 - num2;
                        break;
                      case '*':
                        result = num1 * num2;
                        break;
                      case '/':
                        result = num1 ~/ num2;
                        break;
                      case '%':
                        result = num1 % num2;
                        break;
                      default:
                        result = 0;
                    }

                    viewModel.dispatch(UpdateResultAction(result));
                  },
                  child: Text('Calculate'),
                ),
                Text(
                  'Result: ${viewModel.state.result}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final Store<AppState> store;
  AppState get state => store.state;

  _ViewModel({required this.store});

  void dispatch(dynamic action) {
    store.dispatch(action);
  }
}
