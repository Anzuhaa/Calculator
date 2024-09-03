
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'action.dart';
import 'state.dart';

class MyBangunRuang extends StatelessWidget {
  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController sisiController = TextEditingController();
  final TextEditingController jariJariController = TextEditingController();
  final TextEditingController tinggiTabungController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Bangun Ruang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Text('Keliling Balok'),
            TextField(
              controller: panjangController,
              decoration: InputDecoration(labelText: 'Panjang'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: lebarController,
              decoration: InputDecoration(labelText: 'Lebar'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tinggiController,
              decoration: InputDecoration(labelText: 'Tinggi'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final panjang = double.tryParse(panjangController.text) ?? 0;
                final lebar = double.tryParse(lebarController.text) ?? 0;
                final tinggi = double.tryParse(tinggiController.text) ?? 0;

                StoreProvider.of<BentukState>(context).dispatch(
                  CalculateBalokKelilingAction(panjang, lebar, tinggi),
                );
              },
              child: Text('Hitung Keliling Balok'),
            ),

            SizedBox(height: 16),
            Text('Keliling Kubus'),
            TextField(
              controller: sisiController,
              decoration: InputDecoration(labelText: 'Sisi'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final sisi = double.tryParse(sisiController.text) ?? 0;

                StoreProvider.of<BentukState>(context).dispatch(
                  CalculateKubusKelilingAction(sisi),
                );
              },
              child: Text('Hitung Keliling Kubus'),
            ),

            SizedBox(height: 16),
            Text('Keliling Tabung'),
            TextField(
              controller: jariJariController,
              decoration: InputDecoration(labelText: 'Jari-Jari'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tinggiTabungController,
              decoration: InputDecoration(labelText: 'Tinggi'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final jariJari = double.tryParse(jariJariController.text) ?? 0;
                final tinggi = double.tryParse(tinggiTabungController.text) ?? 0;

                StoreProvider.of<BentukState>(context).dispatch(
                  CalculateTabungKelilingAction(jariJari, tinggi),
                );
              },
              child: Text('Hitung Keliling Tabung'),
            ),
            
            SizedBox(height: 32),
            StoreConnector<BentukState, String>(
              converter: (store) => 'Keliling: ${store.state.keliling}',
              builder: (context, kelilingText) {
                return Text(
                  kelilingText,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}