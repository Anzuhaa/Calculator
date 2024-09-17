// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:calculator_redux/Redux/actions.dart';
import 'package:calculator_redux/Redux/state.dart';
import 'package:calculator_redux/Redux/store.dart';
import 'package:calculator_redux/widgets/my_text.dart';
import 'package:calculator_redux/widgets/my_textbutton.dart';
import 'package:calculator_redux/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MyAritmatikPage extends StatefulWidget {
  @override
  _MyAritmatikPageState createState() => _MyAritmatikPageState();
}

class _MyAritmatikPageState extends State<MyAritmatikPage> {
  final TextEditingController _inputController1 = TextEditingController();
  final TextEditingController _inputController2 = TextEditingController();
  String _operation = '+';

  @override
  Widget build(BuildContext context) {
    return StoreProvider<StateAritmatik>(
      store: storeAritmatika,
      child: Scaffold(
        appBar: AppBar(
          title: MyText(
            text: 'text',
            fontsize: 20,
            fontfamily: 'Montserrat',
            color: Color(0xfff3f3f3),
          ),
          backgroundColor: Color(0xff1c1d22),
        ),
        backgroundColor: Color(0xff1c1d22),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyTextfield(
                  text: 'Angka Pertama',
                  label: 'Masukan Angka',
                  controller: _inputController1),
              MyTextfield(
                  text: 'Angka Kedua',
                  label: 'Masukan Angka',
                  controller: _inputController2),
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
              MyTextbutton(
                text: 'Calculate',
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
                  StoreProvider.of<StateAritmatik>(context)
                      .dispatch(UpdateResultAction(result));
                },
                backgroundColor: Color(0xff2f2f2f),
                textColor: Color(0xfff3f3f3),
              ),
              StoreConnector<StateAritmatik, int>(
                converter: (store) => storeAritmatika.state.result,
                builder: (context, result) => MyText(
                  text: 'Hasil: $result',
                  fontsize: 16,
                  fontfamily: 'MontserratSemi',
                  color: Color(0xfff3f3f3),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ViewModel {
  final Store<StateAritmatik> store;
  StateAritmatik get state => store.state;

  _ViewModel({required this.store});
}
