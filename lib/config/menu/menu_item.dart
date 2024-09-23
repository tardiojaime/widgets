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
  MenuItem(
      title: 'Animated container',
      subtitle: 'Stateful widget animado',
      url: '/animated',
      icon: Icons.check_box_outline_blank_rounded,
      name: AnimatedScreen.name),
  MenuItem(
      title: 'Ui Controls',
      subtitle: 'Ui controls, radiobutton switch',
      url: '/uicontrols',
      icon: Icons.car_rental_outlined,
      name: UiControlsScreen.name),
  MenuItem(
      title: 'Introduccion a la Aplicacion',
      subtitle: 'Pequeno tutorial introductorio',
      url: '/tutorial',
      icon: Icons.accessible_rounded,
      name: AppTutorialScreen.name),
  MenuItem(
      title: 'InfiniteScroll y Pull',
      subtitle: 'Listas infinitas y pul to refresh',
      url: '/infinite',
      icon: Icons.list_alt_rounded,
      name: InfiniteScrollScreen.name),
  MenuItem(
      title: 'Riverpod Counter',
      subtitle: 'Contador con Riverpob',
      url: '/counter',
      icon: Icons.plus_one,
      name: CounterScreen.name),
  MenuItem(
      title: 'Cambiar tema',
      subtitle: 'Cambiar tema de la aplicacion',
      url: '/theme-changer',
      icon: Icons.color_lens_outlined,
      name: ThemeChanger.name),
];
