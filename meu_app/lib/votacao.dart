// votacao.dart
import 'package:flutter/material.dart';

class VotacaoApp extends StatelessWidget {
  const VotacaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const VotacaoPage(); // <<< Apenas isso! Sem MaterialApp aqui
  }
}

class VotacaoPage extends StatefulWidget {
  const VotacaoPage({super.key});

  @override
  _VotacaoState createState() => _VotacaoState();
}

class _VotacaoState extends State<VotacaoPage> {
  int _contadorGatos = 0;
  int _contadorCachorros = 0;

  void _incrementarGatos() {
    setState(() {
      _contadorGatos++;
    });
  }

  void _incrementarCachorros() {
    setState(() {
      _contadorCachorros++;
    });
  }

  void _resetar() {
    setState(() {
      _contadorCachorros = 0;
      _contadorGatos = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simulador de Votação"),
        // O botão de voltar vai aparecer automaticamente agora!
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🐱 Gatos: $_contadorGatos  🐶 Cachorros: $_contadorCachorros',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 16),
            const Text(
              "Resultado",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _incrementarGatos, child: const Text("Votar em Gatos")),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _incrementarCachorros,
                  child: const Text("Votar em Cachorros"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetar,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text("Resetar"),
            ),
          ],
        ),
      ),
    );
  }
}
