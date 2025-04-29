// contador.dart
import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});
  
  @override
  _ContadorState createState() => _ContadorState();
}


class _ContadorState extends State<Contador> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _decrementar() {
    setState(() {
      _contador--;
    });
  }

  void _resetar() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador com Estado')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Valor: $_contador',
            style: TextStyle(
              fontSize: 32,
              color: _contador < 0 ? Colors.red : Colors.black,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _incrementar, child: Text('+')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: _decrementar, child: Text('-')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: _resetar, child: Text('Resetar')),
            ],
          ),
        ],
      ),
    );
  }
}
