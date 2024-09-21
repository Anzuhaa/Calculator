// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:calculator_redux/Redux/actions.dart';
import 'package:calculator_redux/Redux/state.dart';
import 'package:calculator_redux/main.dart';
import 'package:calculator_redux/widgets/my_text.dart';
import 'package:calculator_redux/widgets/my_textbutton.dart';
import 'package:calculator_redux/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyAritmatikPage extends StatefulWidget {
  @override
  _MyAritmatikPageState createState() => _MyAritmatikPageState();
}

class _MyAritmatikPageState extends State<MyAritmatikPage> {
  final TextEditingController _inputController1 = TextEditingController();
  final TextEditingController _inputController2 = TextEditingController();
  String operation = '+';

  @override
  void initState() {
    super.initState();
    StoreProvider.of<AppState>(context, listen: false)
        .dispatch(CalculateAritmatik(0));
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xFFF3F3F3),
          ),
          title: MyText(
            text: 'Aritmatika',
            fontsize: 24,
            fontfamily: 'MontserratBold',
            color: Color(0xFFF3F3F3),
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
                value: operation,
                items: <String>['+', '-', '*', '/', '%']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    operation = newValue!;
                  });
                },
                style: TextStyle(
                  color: Color(0xfff3f3f3),
                ),
                dropdownColor: Color(0xff1c1d22),
              ),
              MyTextbutton(
                text: 'Hitung Aritmatika',
                onPressed: () {
                  final num1 = double.parse(_inputController1.text);
                  final num2 = double.parse(_inputController2.text);
                  double value;
                  switch (operation) {
                    case '+':
                      value = num1 + num2;
                      break;
                    case '-':
                      value = num1 - num2;
                      break;
                    case '*':
                      value = num1 * num2;
                      break;
                    case '/':
                      value = num1 / num2;
                      break;
                    case '%':
                      value = num1 % num2;
                      break;
                    default:
                      value = 0;
                  }
                  StoreProvider.of<AppState>(context)
                      .dispatch(CalculateAritmatik(value));
                },
                backgroundColor: Color(0xFF5865f2),
                textColor: Color(0xfff3f3f3),
              ),
              StoreConnector<AppState, double>(
                converter: (store) => store.state.value,
                builder: (context, value) => MyText(
                  text: 'Hasil: $value',
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
