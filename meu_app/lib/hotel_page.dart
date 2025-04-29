import 'package:flutter/material.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _obsController = TextEditingController();
  String _tipoQuarto = 'Solteiro';
  DateTime? _dataEntrada;
  DateTime? _dataSaida;
  bool _dadosRegistrados = false;
  double _valorFinal = 0;
  int _diarias = 0;

  final Map<String, double> _valoresPorTipo = {
    'Solteiro': 100.0,
    'Casal': 150.0,
    'Luxo': 250.0,
  };

  void _selecionarDataEntrada() async {
    final dataEscolhida = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (dataEscolhida != null) {
      setState(() {
        _dataEntrada = dataEscolhida;
        _dataSaida = null;
      });
    }
  }

  void _selecionarDataSaida() async {
    final dataEscolhida = await showDatePicker(
      context: context,
      initialDate: _dataEntrada?.add(const Duration(days: 1)) ?? DateTime.now(),
      firstDate: _dataEntrada?.add(const Duration(days: 1)) ?? DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (dataEscolhida != null) {
      setState(() {
        _dataSaida = dataEscolhida;
      });
    }
  }

  void _registrarEstadia() {
    if (_nomeController.text.isNotEmpty &&
        _dataEntrada != null &&
        _dataSaida != null) {
      _diarias = _dataSaida!.difference(_dataEntrada!).inDays;
      final valorDiaria = _valoresPorTipo[_tipoQuarto]!;
      _valorFinal = _diarias * valorDiaria;

      setState(() {
        _dadosRegistrados = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os dados obrigatórios.')),
      );
    }
  }

  String _formatarData(DateTime? data) {
    if (data == null) return '';
    return '${data.day}/${data.month}/${data.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('Hotel Paradise 🌴'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'images/photo-1582719478250-c89cae4dc85b.jpeg',
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Faça sua reserva',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do hóspede'),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _tipoQuarto,
              decoration: const InputDecoration(labelText: 'Tipo de quarto'),
              items: _valoresPorTipo.entries
                  .map((entry) => DropdownMenuItem(
                        value: entry.key,
                        child: Text('${entry.key} - R\$ ${entry.value.toStringAsFixed(2)}/noite'),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _tipoQuarto = value!;
                });
              },
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: _selecionarDataEntrada,
              icon: const Icon(Icons.calendar_today),
              label: Text(
                _dataEntrada == null
                    ? 'Selecionar data de entrada'
                    : 'Entrada: ${_formatarData(_dataEntrada)}',
              ),
            ),
            TextButton.icon(
              onPressed: _dataEntrada == null ? null : _selecionarDataSaida,
              icon: const Icon(Icons.calendar_month),
              label: Text(
                _dataSaida == null
                    ? 'Selecionar data de saída'
                    : 'Saída: ${_formatarData(_dataSaida)}',
              ),
            ),
            TextField(
              controller: _obsController,
              decoration: const InputDecoration(labelText: 'Observações (opcional)'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registrarEstadia,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text('Registrar estadia'),
            ),
            const SizedBox(height: 20),
            if (_dadosRegistrados)
              Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('📝 Registro realizado:', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Nome: ${_nomeController.text}'),
                      Text('Quarto: $_tipoQuarto'),
                      if (_dataEntrada != null)
                        Text('Entrada: ${_formatarData(_dataEntrada)}'),
                      if (_dataSaida != null)
                        Text('Saída: ${_formatarData(_dataSaida)}'),
                      Text('Diárias: $_diarias'),
                      Text('Valor final: R\$ ${_valorFinal.toStringAsFixed(2)}'),
                      if (_obsController.text.isNotEmpty)
                        Text('Observações: ${_obsController.text}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

