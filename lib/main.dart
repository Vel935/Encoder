import 'package:flutter/material.dart';
import './pages/generatorPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Generador de Contraseñas'), backgroundColor: Colors.blueAccent,),
        body: const Center(
          child: //Text("hola mundo")
          GeneratorPage(),
        ),
      ),
    );
  }
}
