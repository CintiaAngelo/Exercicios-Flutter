import 'package:flutter/material.dart';

class AnimalFavoritoPage extends StatefulWidget {
  const AnimalFavoritoPage({super.key});

  @override
  State<AnimalFavoritoPage> createState() => _AnimalFavoritoPageState();
}

class _AnimalFavoritoPageState extends State<AnimalFavoritoPage> {
  final Map<String, int> _votos = {};
  final TextEditingController _controller = TextEditingController();

  void _votar() {
    final animal = _controller.text.trim();
    if (animal.isNotEmpty) {
      setState(() {
        _votos[animal] = (_votos[animal] ?? 0) + 1;
        _controller.clear();
      });
    }
  }

  String getAnimalMaisVotado() {
    if (_votos.isEmpty) return 'Nenhum voto ainda.';
    final maisVotado = _votos.entries.reduce(
      (a, b) => a.value >= b.value ? a : b,
    );
    return 'Animal mais votado: ${maisVotado.key} (${maisVotado.value} votos)';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animal Favorito do Mês')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Digite um animal'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _votar, child: const Text('Votar')),
            const SizedBox(height: 32),
            Text(
              getAnimalMaisVotado(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
