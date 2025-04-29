import 'package:flutter/material.dart';

void main() => runApp(const CarrinhoApp());

class CarrinhoApp extends StatelessWidget {
  const CarrinhoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CarrinhoPage());
  }
}

// ✅ Corrigido: construtor com super.key e classe pública
class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => CarrinhoState(); // ✅ classe pública
}

// ✅ Classe pública (removido o underline)
class CarrinhoState extends State<CarrinhoPage> {
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
      appBar: AppBar(
        title: const Text("Carrinho de Compras"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Itens no carrinho: $_contador',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 24),
            Text(
              _contador == 0
                  ? "Status: Carrinho vazio"
                  : "Status: Itens adicionados",
              style: TextStyle(
                fontSize: 20,
                color: _contador == 0 ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _incrementar, child: const Text("Adicionar")),
                const SizedBox(width: 12),
                ElevatedButton(onPressed: _decrementar, child: const Text("Remover")),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetar,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text("Esvaziar"),
            ),
          ],
        ),
      ),
    );
  }
}
