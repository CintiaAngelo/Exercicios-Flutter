// home_page.dart
import 'package:flutter/material.dart';
import 'package:meu_app/carrinho.dart';
import 'package:meu_app/hotel_page.dart';
import 'contador.dart';
import 'votacao.dart';
import 'produto_comprado.dart';
import 'animal_favorito.dart';
import 'cliente_engajado.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplos Flutter')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Contador'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Contador()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Votação'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VotacaoApp()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Carrinho'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CarrinhoApp()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Produto Mais Comprado'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProdutoComprasPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Animal Favorito do Mês'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnimalFavoritoPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Cliente Mais Engajado'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClientePage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Hotel'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HotelPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
