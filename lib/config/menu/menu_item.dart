import 'package:flutter/material.dart';
import 'package:widgets/presentation/screens/screen.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String url;
  final IconData icon;
  final String name;

  const MenuItem(
      {required this.name,
      required this.title,
      required this.subtitle,
      required this.url,
      required this.icon});
}

const List<MenuItem> appMenuItems = [
  MenuItem(
      title: 'Botones',
      subtitle: 'Varios botones en flutter',
      url: '/buttons',
      icon: Icons.smart_button_outlined,
      name: ButtonsScreen.name),
  MenuItem(
      title: 'Tarjetas..',
      subtitle: 'Un contenedor estilizad...',
      url: '/cards',
      icon: Icons.smart_button_outlined,
      name: CardScreen.name),
  MenuItem(
      title: 'ProgressIndicators..',
      subtitle: 'Progress',
      url: '/progress',
      icon: Icons.refresh_rounded,
      name: ProgressScreen.name),
  MenuItem(
      title: 'SnackBars and dialogos',
      subtitle: 'SnackBars y dialogs...',
      url: '/snackbars',
      icon: Icons.refresh_rounded,
      name: SnackbarScreen.name),
];
