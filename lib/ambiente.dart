import 'package:flutter/material.dart';

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
  double posicaoHorizontalHeroi = 50;
  double posicaoVerticalHeroi = 20;
  double posHorizontalPocao = 150;
  double posVerticalPocao = 200;
  late int _vida;
  bool pocaoColetada = false;

@override
  void initState(){
    super.initState();
    _vida = widget.vida;
  }

  void andarParaDireita() {
    setState(() {
      posicaoHorizontalHeroi += 40;
    });
  }

  void andarParaEsquerda() {
    setState(() {
      if (posicaoHorizontalHeroi > 10) {
        posicaoHorizontalHeroi -= 40;
      }
    });
  }

  void andarParaCima() async {
    setState(() {});
    if (posicaoVerticalHeroi > 20) {
      setState(() {
        posicaoVerticalHeroi = posicaoVerticalHeroi + 40;
      });
      checarColisao();
      await Future.delayed(const Duration(milliseconds: 400));
      setState(() {
        posicaoVerticalHeroi = posicaoVerticalHeroi - 40;
      });
    }
  }

  void checarColisao() {
    if (pocaoColetada) return;

    bool bateX = (posicaoHorizontalHeroi - posHorizontalPocao).abs() < 60;
    bool bateY = (posicaoVerticalHeroi - posVerticalPocao).abs() < 60;

    if (bateX && bateY) {
      setState(() {
        pocaoColetada = true;
        _vida += 50;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text('Sala 1 - Jogando de ${widget.heroi}'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
     ),

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network("https://chatgpt.com/s/m_6abfa0901bc0819180d4b56869974907",
             fit: BoxFit.cover,
            ),
          ),
          Visibility(
            visible: !pocaoColetada,
            child: Positioned(
              left: posHorizontalPocao,
              bottom: posVerticalPocao,
              child: Image.network("https://chatgpt.com/s/m_6abfa702b1a08191b52d491c801bd623"),
            ),
          ),
          AnimatedPositioned(
            duration: Duration (milliseconds: 200),
            curve: Curves.easeInOut,
            left: posicaoHorizontalHeroi,
            bottom: posicaoVerticalHeroi,
            child: Image.network(
              widget.urlImagem,
              height: 130,
            ),
          ),
       
Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.white, 
                    foregroundColor: Colors.black,
                  ),
                  onPressed: andarParaEsquerda,
                  child: const Icon(Icons.arrow_back_ios_new, size: 30),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: andarParaDireita,
                  child: const Icon(Icons.arrow_forward_ios, size: 30),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: andarParaCima,
                  child: const Icon(Icons.arrow_circle_up, size: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
      

