import 'package:flutter/material.dart';

class TelaJogoHeroi extends StatefulWidget {
  @override
  State <TelaJogoHeroi> createState() => TelaJogoHeroiState ();
}


 class TelaJogoHeroiState extends State<TelaJogoHeroi> {
  String nomeHeroi = '';
  int vida = 0;
  int moedas = 0;
  int poder = 0;
  String urlImagem = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(body:
      Center(
        child: Column(
          children: [
            Text("Ecolha um heroi"),
            ElevatedButton(
              onPressed: () => escolherheroi ("Arqueiro"),
              child: Text("Arqueiro")
            ),
            ElevatedButton(
              onPressed: () => escolherheroi ("Guerreiro"),
              child: Text("Guerreiro")
            ),
            ElevatedButton(
              onPressed: () => escolherheroi ("Mago"),
              child: Text("Mago")
            ),
            Card(
                elevation: 5, 
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('Classe: $nomeHeroi', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const Divider(),
                      Text('❤️ Vida: $vida', style: const TextStyle(fontSize: 18, color: Colors.red)),
                      Text('💰 Moedas: $moedas', style: const TextStyle(fontSize: 18, color: Colors.orange)),
                      Text('⚔️ Poder: $poder', style: const TextStyle(fontSize: 18, color: Colors.blue)),
                    ],
                  ),
                )
              )
          ],
        )
      )
    );
    


  }
  void escolherheroi (String tipoHeroi) {
    setState(() {
      if(tipoHeroi == "Guerreiro") {
      nomeHeroi = "Guerreiro";
      vida = 200;
      moedas = 50;
      poder = 100;
      urlImagem ="https://chatgpt.com/s/m_6aad26bd7ae48191bc50d07a71d90fbf";

    } else if (tipoHeroi == "Mago" ) {
      nomeHeroi = "Mago";
      vida = 250;
      moedas = 50;
      poder = 500;
      urlImagem ="https://chatgpt.com/s/m_6aad27c526b48191b623db9b6c05319d";
    } else if (tipoHeroi == "Arqueiro") {
      nomeHeroi = "Arqueiro";
      vida = 250;
      moedas = 50;
      poder = 400;
      urlImagem = "https://chatgpt.com/s/m_6aad282b5418819192677cbcc8162af7";
    }

   });
  }
 }