import 'package:flutter/material.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({super.key});

  @override
  State<ClientePage> createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  final Map<String, int> _clientes = {};
  final TextEditingController _controller = TextEditingController();

  void _registrarEngajamento() {
    final nome = _controller.text.trim();
    if (nome.isNotEmpty) {
      setState(() {
        _clientes[nome] = (_clientes[nome] ?? 0) + 1;
        _controller.clear();
      });
    }
  }

  String getClienteMaisEngajado() {
    if (_clientes.isEmpty) return 'Nenhum cliente engajado ainda.';
    final maisEngajado = _clientes.entries.reduce(
      (a, b) => a.value >= b.value ? a : b,
    );
    return 'Cliente mais engajado: ${maisEngajado.key} (${maisEngajado.value} interações)';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cliente Mais Engajado')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Nome do cliente'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _registrarEngajamento, child: const Text('Registrar')),
            const SizedBox(height: 32),
            Text(
              getClienteMaisEngajado(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
