import 'package:flutter/material.dart';

class Pantalla4 extends StatelessWidget {
  const Pantalla4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reproducir")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        
      ),
    );
  }
}