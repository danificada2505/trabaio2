import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    );
  }
}


class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});


  @override
  State<TelaInicial> createState() => _TelaInicialState();
}


class _TelaInicialState extends State<TelaInicial> {
  String acaoAtual = 'Parado';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                acaoAtual,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ControlesJogo(
            onEsquerda: () {
              setState(() {
                acaoAtual = 'Movendo para a Esquerda';
              });
            },
            onDireita: () {
              setState(() {
                acaoAtual = 'Movendo para a Direita';
              });
            },
            onPular: () {
              setState(() {
                acaoAtual = 'Pulou!';
              });
            },
          ),
        ],
      ),
    );
  }
}
class ControlesJogo extends StatelessWidget {
  final VoidCallback onEsquerda;
  final VoidCallback onDireita;
  final VoidCallback onPular;


  const ControlesJogo({
    super.key,
    required this.onEsquerda,
    required this.onDireita,
    required this.onPular,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton.filled(
                onPressed: onEsquerda,
                icon: const Icon(Icons.arrow_back, size: 32),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: onDireita,
                icon: const Icon(Icons.arrow_forward, size: 32),
              ),
            ],
          ),
          IconButton.filled(
            onPressed: onPular,
            style: IconButton.styleFrom(backgroundColor: Colors.green),
            icon: const Icon(Icons.arrow_upward, size: 36),
          ),
        ],
      ),
    );
  }
}
