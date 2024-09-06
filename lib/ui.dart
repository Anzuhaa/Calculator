import 'package:calculator_redux/widgets/my_textbutton.dart';
import 'package:calculator_redux/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'Redux/actions.dart';
import 'Redux/state.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _sideController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _side1Controller = TextEditingController();
  final TextEditingController _side2Controller = TextEditingController();
  final TextEditingController _side3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1d22),
      appBar: AppBar(title: const Text('Geometric Calculator - Perimeter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyTextfield(text: "Persegi", label: "Sisi Persegi", controller: _sideController),
            MyTextbutton(text: "Hitung", onPressed: (){              final side = double.tryParse(_sideController.text) ?? 0.0;
              StoreProvider.of<StateBangunDatar>(context).dispatch(CalculateSquareValue(side));
              }, backgroundColor: Color(0xFF5865f2), textColor: Color(0xFFf3f3f3),),

            const Text("PERSEGI"),
            _buildInputField('Sisi persegi:', _sideController),
            _buildCalculateButton('Hitung', () {
              final side = double.tryParse(_sideController.text) ?? 0.0;
              StoreProvider.of<StateBangunDatar>(context).dispatch(CalculateSquareValue(side));
            }),

            const SizedBox(height: 30,),

            const Text("PERSEGI PANJANG"),
            _buildInputField('Panjang:', _lengthController),
            _buildInputField('Lebar:', _widthController),
            _buildCalculateButton('Hitung', () {
              final length = double.tryParse(_lengthController.text) ?? 0.0;
              final width = double.tryParse(_widthController.text) ?? 0.0;
              StoreProvider.of<StateBangunDatar>(context).dispatch(CalculateRectangleValue(length, width));
            }),

            const SizedBox(height: 30,),

            const Text("SEGITIGA"),
            _buildInputField('Sisi 1:', _side1Controller),
            _buildInputField('Sisi 2:', _side2Controller),
            _buildInputField('Sisi 3:', _side3Controller),
            _buildCalculateButton('Hitung', () {
              final side1 = double.tryParse(_side1Controller.text) ?? 0.0;
              final side2 = double.tryParse(_side2Controller.text) ?? 0.0;
              final side3 = double.tryParse(_side3Controller.text) ?? 0.0;
              StoreProvider.of<StateBangunDatar>(context).dispatch(CalculateTriangleValue(side1, side2, side3));
            }),

            const SizedBox(height: 20),
            StoreConnector<StateBangunDatar, double>(
              converter: (store) => store.state.value,
              builder: (context, perimeter) => Text('Hasil: $perimeter', style: const TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildCalculateButton(String label, VoidCallback onPressed) {
    return ElevatedButton(onPressed: onPressed, child: Text(label));
  }
}