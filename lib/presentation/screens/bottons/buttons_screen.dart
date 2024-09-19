import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'button_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button screen'),
      ),
      body: const _ButtonsView(),
      // botones flotantes
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //volver hacia atras
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Wrap(
          // espacion entre los hijos
          spacing: 10,
          // alineacion de los hijos
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit),
                label: const Text('Elevated icon')),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              label: const Text('Filled icon'),
              icon: const Icon(Icons.account_balance),
            ),
            OutlinedButton(
                onPressed: () {}, child: const Text('Outline button')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit_sharp),
                label: const Text('Outline icon')),
            TextButton(onPressed: () {}, child: const Text('Text button')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_box_outlined),
                label: const Text('Text button icon')),
            // _TODO: Botones personalizados - custom button
            const CustomButton(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.primary),
                  iconColor: const WidgetStatePropertyAll(Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      //widget que permite recortar su hijo (otro widget) en una forma rectangular con bordes redondeados.
      borderRadius: BorderRadius.circular(20),
      child: Material(
        // bloque base para crear interfaces que siguen el diseño Material Design de Google
        color: colors.primary,
        child: InkWell(
          //widget que responde a interacciones táctiles, BIENE  con animaciones
          onTap: () {},
          child: const Padding(
              // Iserciones de borde | edge - borde
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Custom data',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
