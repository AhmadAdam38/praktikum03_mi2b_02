import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp( MyApp());
}

Widget buatKotak (Color warna, double ukuran) {
  return Container(
    decoration: BoxDecoration(
      color: warna
    ),
    height: ukuran,
    width: ukuran,
    margin: EdgeInsets.all(10),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
    double _inputUser=0;
    double _kelvin=0;
    double _reamur=0;

    final _adam=TextEditingController();

    void _ditekan(){
    setState(() {
      _inputUser=double.parse(_adam.text);
      _kelvin=_inputUser+273.15;
      _reamur=(_inputUser*4)/5;
    });
    }
    
    void dispose(){
      _adam.dispose();
      super.dispose();
    }

  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konversi Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Masukan(adam: _adam),
              output(kelvin: _kelvin, reamur: _reamur),
              Container(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: _ditekan,
                  child: Text(
                    "Konversi Suhu",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  ),
              ),
              
            ],
          ),
        ),
        ),
    );
  }
}

class output extends StatelessWidget {
  const output({
    Key? key,
    required double kelvin,
    required double reamur,
  }) : _kelvin = kelvin, _reamur = reamur, super(key: key);

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Container(
              alignment: Alignment.topCenter,
              child: Text("Suhu dalam Kelvin"),
            ),
            Text(
              '$_kelvin',
              style: TextStyle(
                fontSize: 60,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Container(
              alignment: Alignment.topCenter,
              child: Text("Suhu dalam Reamor"),
            ),
            Text(
              '$_reamur',
              style: TextStyle(
                fontSize: 60,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Masukan extends StatelessWidget {
  const Masukan({
    Key? key,
    required TextEditingController adam,
  }) : _adam = adam, super(key: key);

  final TextEditingController _adam;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _adam,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      
      decoration: InputDecoration(
        hintText: 'Masukkan Suhu Dalam Celcius',
      ),
    );
  }
}

