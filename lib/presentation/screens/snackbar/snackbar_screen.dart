import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const String name = 'snackbar_screen';

  void showCustomSnackBar(BuildContext context) {
    //primero eliminamos para evitar que se generen varios
    ScaffoldMessenger.of(context).clearSnackBars();
    // dentro - inside
    final snackbar = SnackBar(
      content: const Text('message inside snackbar'),
      // cualquier accion en el, se ocultaran el snackbar
      action: SnackBarAction(
        label: 'ok',
        onPressed: () {},
      ),
      // ocultarse desde de un 2 s.
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars and dialogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
