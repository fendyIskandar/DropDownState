import 'package:flutter/material.dart';
import 'package:konversi2/widgets/inputSuhu.dart';
import 'package:konversi2/widgets/konversiSuhu.dart';
import 'package:konversi2/widgets/perhitunganTerakhir.dart';
import 'package:konversi2/widgets/riwayatPerhitungan.dart';
import 'package:konversi2/widgets/targetPerhitungan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Fahrenheit'];
  String selectedDropDown = 'Kelvin';
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void onDropDownChange(Object? value) {
    return setState(() {
      selectedDropDown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        hasilPerhitungan = int.parse(etInput.text) * 2;
        switch (selectedDropDown) {
          case 'Kelvin':
            hasilPerhitungan = int.parse(etInput.text) + 273.15;
            break;
          case 'Reamur':
            hasilPerhitungan = int.parse(etInput.text) * 4 / 5;
            break;
          case 'Fahrenheit':
            hasilPerhitungan = (int.parse(etInput.text) * 9 / 5) + 32;
            break;
        }
        listHasil.add("Konversi dari " +
            etInput.text +
            " Celcius ke " +
            selectedDropDown +
            " Dengan Hasil : " +
            hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            inputSuhu(etInput: etInput),
            const SizedBox(height: 8),
            targetPerhitungan(
              selectedDropDown: selectedDropDown,
              listSatuanSuhu: listSatuanSuhu,
              onDropDownChange: onDropDownChange,
            ),
            SizedBox(height: 10),
            Text(
              'hasil',
              style: TextStyle(fontSize: 20),
            ),
            perhitunganTerakhir(hasilPerhitungan: hasilPerhitungan),
            const SizedBox(height: 10),
            KonversiSuhu(
              onPressed: konversiSuhu,
            ),
            const SizedBox(height: 10),
            Text(
              'Riwayat Konversi',
              style: TextStyle(fontSize: 20),
            ),
            riwayatPerhitungan(listHasil: listHasil),
          ],
        ),
      ),
    );
  }
}
