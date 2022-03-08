import 'package:flutter/material.dart';

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
            TextField(
              controller: etInput,
              decoration: InputDecoration(
                labelText: 'Celcius',
                hintText: 'Enter  the temperature in celcius',
              ),
            ),
            SizedBox(height: 8),
            DropdownButton(
              isExpanded: true,
              value: selectedDropDown,
              items: listSatuanSuhu.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                onDropDownChange(value);
              },
            ),
            SizedBox(height: 10),
            Text(
              'hasil',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '365',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Konversi Suhu'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Riwayat Konversi',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
