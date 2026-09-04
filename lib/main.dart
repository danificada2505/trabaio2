import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home:
      TelaInicial());
  }
}

class TelaInicial extends StatelessWidget{
       const TelaInicial ({super.key});
       
       @override
       Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
           child: ElevatedButton(
            onPressed: () {
              Navigator.push (
                context,
                MaterialPageRoute(builder: (context) => const TelaInicial()),
              );
            },
              child: const Text ('Go to tela inicial')
            )
          )
        );
       }
  }

