import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ui Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = true;
  bool wantsDinner = false;
  bool wantsLunch = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          value: true,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
        ),
        //muy útil para mostrar una lista de elementos que puede expandirse o contraerse
        ExpansionTile(
          title: Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: Text('By Car'),
                subtitle: const Text('Viajar en carro'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.car;
                  });
                }),
            RadioListTile(
                title: Text('By Plane'),
                subtitle: Text('Viajar en Avion'),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (_) {
                  setState(() {
                    selectedTransportation = Transportation.plane;
                  });
                }),
            RadioListTile(
                title: Text('By boat'),
                subtitle: Text('Viajar por barco'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.boat;
                  });
                }),
            RadioListTile(
                title: Text('By Submarine'),
                subtitle: Text('Viajar por submarino'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (_) {
                  setState(() {
                    selectedTransportation = Transportation.submarine;
                  });
                })
          ],
        ),
        CheckboxListTile(
          title: Text('Desayuno?'),
          subtitle: Text('do you want breakfast..?'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Cenar?'),
          subtitle: Text('do you want dinner..?'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Almorzar?'),
          subtitle: Text('do you want lunch..?'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
      ],
    );
  }
}
