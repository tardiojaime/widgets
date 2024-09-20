import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.cyan;
  double borderRadios = 10;

  // para cambiar propiedades - con numeros aleatorios
  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 50;
    height = random.nextInt(300) + 40;
    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    borderRadios = random.nextInt(40) + 20;
    // cada ves que se cambia el estado de una propiedad
    // se debe llamar al setState
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        // un contenedor que facilita las animaciones
        child: AnimatedContainer(
          // duracion de las animaciones
          duration: const Duration(milliseconds: 500),
          //tipo de animacion - similar a las de css
          curve: Curves.easeOutCubic,
          // si width es un valor negativo
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadios)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
