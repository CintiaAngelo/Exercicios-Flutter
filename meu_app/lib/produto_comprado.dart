import 'package:flutter/material.dart';

class ProdutoComprasPage extends StatefulWidget {
  const ProdutoComprasPage({super.key});

  @override
  State<ProdutoComprasPage> createState() => _ProdutoComprasPageState();
}

class _ProdutoComprasPageState extends State<ProdutoComprasPage> {
  final Map<String, int> _quantidadePorProduto = {};
  final Map<String, double> _precoPorProduto = {
    'Maçã': 2.50,
    'Limão': 1.80,
    'Panela': 45.00,
    'Sabão': 3.20,
  };

  String? _produtoSelecionado;

  void _registrarCompra() {
    if (_produtoSelecionado != null) {
      setState(() {
        _quantidadePorProduto[_produtoSelecionado!] =
            (_quantidadePorProduto[_produtoSelecionado!] ?? 0) + 1;
      });
    }
  }

  String _produtoMaisComprado() {
    if (_quantidadePorProduto.isEmpty) return 'Nenhum produto comprado ainda.';
    final maisComprado = _quantidadePorProduto.entries.reduce(
      (a, b) => a.value >= b.value ? a : b,
    );
    return '${maisComprado.key} (${maisComprado.value}x)';
  }

  double _calcularTotalGasto() {
    double total = 0.0;
    _quantidadePorProduto.forEach((produto, quantidade) {
      total += quantidade * (_precoPorProduto[produto] ?? 0);
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produto Mais Comprado')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              isExpanded: true,
              value: _produtoSelecionado,
              hint: const Text('Selecione um produto'),
              items: _precoPorProduto.keys.map((produto) {
                return DropdownMenuItem(
                  value: produto,
                  child: Text('$produto - R\$ ${_precoPorProduto[produto]!.toStringAsFixed(2)}'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _produtoSelecionado = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registrarCompra,
              child: const Text('Registrar compra'),
            ),
            const SizedBox(height: 32),
            Text(
              '🛒 Produto mais comprado: ${_produtoMaisComprado()}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              '💰 Total gasto: R\$ ${_calcularTotalGasto().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
