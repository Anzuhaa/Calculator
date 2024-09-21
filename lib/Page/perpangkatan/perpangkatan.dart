// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:calculator_redux/Redux/actions.dart';
import 'package:calculator_redux/Redux/state.dart';
import 'package:calculator_redux/Redux/store.dart';
import 'package:calculator_redux/main.dart';
import 'package:calculator_redux/widgets/my_text.dart';
import 'package:calculator_redux/widgets/my_textbutton.dart';
import 'package:calculator_redux/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

double perpangkatan(double base, double exponent) {
  double result = 1;
  for (double i = 0; i < exponent; i++) {
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
  void initState() {
    super.initState();
    StoreProvider.of<AppState>(context, listen: false)
        .dispatch(CalculatePerpangkatan(0));
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
              text: 'Perpangkatan',
              fontsize: 24,
              fontfamily: 'MontserratBold',
              color: Color(0xFFF3F3F3),
            ),
            backgroundColor: Color(0xff1c1d22),
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
                  text: "Hitung Perpangkatan",
                  onPressed: () {
                    final num1 = double.parse(_inputController1.text);
                    final num2 = double.parse(_inputController2.text);
                    double result = perpangkatan(num1, num2);
                    StoreProvider.of<AppState>(context)
                        .dispatch(CalculatePerpangkatan(result));
                  },
                  backgroundColor: Color(0xFF5865f2),
                  textColor: Color(0xfff3f3f3),
                ),
                StoreConnector<AppState, double>(
                  converter: (store) => store.state.value,
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
