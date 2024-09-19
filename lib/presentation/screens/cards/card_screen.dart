import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardScreen extends StatelessWidget {
  static const String name = 'card_screen';
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card screen'),
      ),
      body: SingleChildScrollView(
        //para que no desborde la pantalla, este permita el scroll

        child: Column(
          children: [
            //se utiliza para insertar los elementos de una colección (listas, conjuntos o mapas) dentro de otra colección.
            ...cards.map(
              (e) => _CardView(label: e['label'], elevation: e['elevation']),
            ),
            ...cards.map(
              (e) => _CardType2(label: e['label'], elevation: e['elevation']),
            ),
            ...cards.map(
              (e) => _CardType3(label: e['label'], elevation: e['elevation']),
            ),
            ...cards.map(
              (e) => _CardType4(label: e['label'], elevation: e['elevation']),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _CardView extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardView({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  // tarjetas con border
  final String label;
  final double elevation;
  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      // shape - forma
      shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.outline),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline, card with birder'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  // tarjetas con border
  final String label;
  final double elevation;
  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      // relleno del card
      color: colors.surfaceContainerHighest,
      // shape - forma
      shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.outline),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              //filled - relleno
              child: Text('$label - Filled, card with filled'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  // tarjetas con border
  final String label;
  final double elevation;
  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      // no permite que los hijos sobrepasen a los de sus padre
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      // shape - forma\
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20))),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            ),
          )
        ],
      ),
    );
  }
}
