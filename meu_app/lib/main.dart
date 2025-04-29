// main.dart
import 'package:flutter/material.dart';
import 'home_page.dart'; // Importa a tela inicial

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(), // Agora mostra a HomePage primeiro
      debugShowCheckedModeBanner: false, // Remove a faixa "DEBUG"
    );
  }
}
