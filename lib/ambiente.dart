import 'package:flutter/material.dart';
import 'package:trabaio2/main.dart';

class TelaAmbiente extends StatefulWidget {

  final String heroi;
  final String urlImagem;
  final int vida;
  final int moedas;
  final int poder;
  
  const TelaAmbiente({
    super.key,
    required this.heroi,
    required this.urlImagem,
    required this.vida,
    required this.moedas,
    required this.poder,
  });

  @override
  State<StatefulWidget> createState () => TelaAmbienteState();

}

class TelaAmbienteState extends State <TelaAmbiente>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(src)
            ),
            AnimatedPositioned(
            duration: Duration (milliseconds: 200),
            curve: Curves.bounceIn
            left: 100,
            bottom: 120,
            child: Image.network(
              Widget.imagem,
              height: 130,
            ),
            )
        ],
      ),
    )
  }

}


  double posicaoHorizontal = 40;
  int millis = 200;

  void andarParaDireita() {
    setState (() {
    if posicaoHorizontal += 40;
     }
    );
  }

  void andarParaEsquerda() {
    setState (() {
    if posicaoHorizontal > 10;
        posicaoHorizontal -= 40;
     }
    );
  }
}
