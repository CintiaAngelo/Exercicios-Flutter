import 'package:flutter/material.dart';

void main() => runApp(CarrinhoApp());

class CarrinhoApp extends StatelessWidget {
  const CarrinhoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CarrinhoPage());
  }
}

class CarrinhoPage extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<CarrinhoPage> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _decrementar() {
    setState(() {
      if (_contador > 0) _contador--;
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
      appBar: AppBar(title: Text("Carrinho de Compras")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Itens no carrinho: $_contador',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 24),
            Text(
              _contador == 0
                  ? "Status: Carrinho vazio"
                  : "Status: Itens adicionados",
              style: TextStyle(
                fontSize: 20,
                color: _contador == 0 ? Colors.red : Colors.green,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _incrementar, child: Text("Adicionar")),
                SizedBox(width: 12),
                ElevatedButton(onPressed: _decrementar, child: Text("Remover")),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetar,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: Text("Esvaziar"),
            ),
          ],
        ),
      ),
    );
  }
}
