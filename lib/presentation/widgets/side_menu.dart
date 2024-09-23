import 'package:flutter/material.dart';
import 'package:widgets/config/menu/menu_item.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffolKey;
  const SideMenu({super.key, required this.scaffolKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final mainStyle = Theme.of(context).textTheme.titleMedium;
    final bool hasNotch = MediaQuery.of(context).viewPadding.top >= 35;
    return NavigationDrawer(
      // el 0, seleccionado  | si es 1: el segundo va seleccionado
      selectedIndex: navDrawerIndex,
      // para cambiar los estilos del seleccionado con
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItems[value];
        context.pushNamed(menuItem.name);
        // verificamos el stado de scaffold, y cerramos el drawer
        widget.scaffolKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 5 : 20, 16, 0),
            child: Text(
              'Main',
              style: mainStyle,
            )),
        ...appMenuItems.sublist(0, 3).map(
              (e) => NavigationDrawerDestination(
                icon: Icon(e.icon),
                label: Text(e.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 2),
          child: Text('More Options'),
        ),
        ...appMenuItems.sublist(3).map(
              (e) => NavigationDrawerDestination(
                  icon: Icon(e.icon), label: Text(e.title)),
            )
      ],
    );
  }
}
