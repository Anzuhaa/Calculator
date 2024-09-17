// ignore_for_file: prefer_const_constructors

import 'package:calculator_redux/Redux/actions.dart';
import 'package:calculator_redux/Redux/store.dart';
import 'package:calculator_redux/widgets/my_textbutton.dart';
import 'package:calculator_redux/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../Redux/state.dart';

class MyTabungPage extends StatefulWidget {
  const MyTabungPage({super.key});

  @override
  State<MyTabungPage> createState() => _MyTabungPageState();
}

class _MyTabungPageState extends State<MyTabungPage> {
  final TextEditingController _Value1 = TextEditingController();
  final TextEditingController _Value2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StoreProvider<StateBangunDatar>(
      store: storeBangunDatar,
      child: Scaffold(
        backgroundColor: Color(0xff1c1d22),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextfield(text: "", label: "Jari-Jari", controller: _Value1),
              MyTextfield(text: "", label: "Tinggi", controller: _Value2),
              MyTextbutton(
                text: "Hitung",
                onPressed: () {
                  final jarijari = double.tryParse(_Value1.text) ?? 0.0;
                  final tinggi = double.tryParse(_Value2.text) ?? 0.0;
                  StoreProvider.of<StateBangunDatar>(context)
                      .dispatch(CalculateTubeValue(jarijari, tinggi));
                },
                backgroundColor: Color(0xFF5865f2),
                textColor: Color(0xFFf3f3f3),
              ),
              StoreConnector<StateBangunDatar, double>(
                converter: (store) => store.state.value,
                builder: (context, result) => Text('Hasil: $result',
                    style: const TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
