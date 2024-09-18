import 'package:flutter/material.dart';
import 'package:widgets/presentation/screens/bottons/buttons_screen.dart';
import 'package:widgets/presentation/screens/cards/card_screen.dart';

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
];
