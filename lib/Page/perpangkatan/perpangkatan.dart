// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:calculator_redux/Redux/actions.dart';
import 'package:calculator_redux/Redux/state.dart';
import 'package:calculator_redux/Redux/store.dart';
import 'package:calculator_redux/widgets/my_text.dart';
import 'package:calculator_redux/widgets/my_textbutton.dart';
import 'package:calculator_redux/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

int perpangkatan(int base, int exponent) {
  int result = 1;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

class MyPerpangkatanPage extends StatefulWidget {
  const MyPerpangkatanPage({super.key});

  @override
  State<MyPerpangkatanPage> createState() => _MyPerpangkatanPageState();
}

class _MyPerpangkatanPageState extends State<MyPerpangkatanPage> {
  final TextEditingController _inputController1 = TextEditingController();
  final TextEditingController _inputController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: storePerpangkatan,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1c1d22),
            title: MyText(
                text: 'Perpangkatan',
                fontsize: 20,
                fontfamily: 'Montserrat',
                color: Color(0xfff3f3f3)),
          ),
          backgroundColor: Color(0xff1c1d22),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyTextfield(
                    text: '',
                    label: 'Masukan Angka',
                    controller: _inputController1),
                MyTextfield(
                    text: '',
                    label: 'Masukan Pangkat',
                    controller: _inputController2),
                MyTextbutton(
                  text: "Calculate",
                  onPressed: () {
                    final num1 = int.parse(_inputController1.text);
                    final num2 = int.parse(_inputController2.text);
                    int result = perpangkatan(num1, num2);
                    StoreProvider.of<StatePerpangkatan>(context)
                        .dispatch(ResultPerpangkatan(result));
                  },
                  backgroundColor: Color(0xff2f2f2f),
                  textColor: Color(0xfff3f3f3),
                ),
                StoreConnector<StatePerpangkatan, int>(
                  converter: (store) => storePerpangkatan.state.value,
                  builder: (context, result) => MyText(
                      text: "Hasil: $result",
                      fontsize: 16,
                      fontfamily: 'MontserratSemi',
                      color: Color(0xfff3f3f3)),
                )
              ],
            ),
          ),
        ));
  }
}
