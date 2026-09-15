import 'package:flutter/material.dart';

class BotaoIniciarExample extends StatelessWidget {
  void _iniciarCodigo() {
    print("Código iniciado com sucesso!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _iniciarCodigo, 
          child: Text('Iniciar'),
        ),
      ),
    );
  }
}