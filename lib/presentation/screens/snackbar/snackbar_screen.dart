import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      // obliga que se realiza algun en el boton para cerrarlo
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text(
            'Informacion de las licencias u otro contenido que se quiera mostrar dentro del panel de dialogo o alerts o contenedores flotantes '),
        actions: [
          TextButton(
              onPressed: () {
                // esta opcion gracias a go_router
                context.pop();
              },
              child: const Text('Cancelar')),
          FilledButton(onPressed: () {}, child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars and dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text('dialogo con las licencias del proyecto')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar Dialogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
