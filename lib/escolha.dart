import 'package:flutter/material.dart';

class EscolhaPersonagemPage extends StatefulWidget {
  @override
  EscolhaPersonagemPageState createState() => EscolhaPersonagemPageState();
}

class EscolhaPersonagemPageState extends State<EscolhaPersonagemPage> {
  final List<String> personagens = ['Guerreiro', 'Mago', 'Arqueiro'];
  int? personagemSelecionado;

  void _confirmarEscolha() {
    if (personagemSelecionado != null) {
      String nome = personagens[personagemSelecionado!];
      print("Personagem escolhido: $nome");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escolha seu Personagem')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: personagens.length,
              itemBuilder: (context, index) {
                bool selecionado = personagemSelecionado == index;

                return Card(
                  color: selecionado ? Colors.blue.shade100 : Colors.white,
                  child: ListTile(
                    title: Text(personagens[index]),
                    trailing: selecionado 
                        ? Icon(Icons.check_circle, color: Colors.blue) 
                        : null,
                    onTap: () {
                      setState(() {
                        personagemSelecionado = index;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: personagemSelecionado == null ? null : _confirmarEscolha,
              child: Text('Confirmar Seleção'),
            ),
          ),
        ],
      ),
    );
  }
}