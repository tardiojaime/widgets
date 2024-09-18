import 'package:go_router/go_router.dart';
import 'package:widgets/presentation/screens/screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    name: CardScreen.name,
    builder: (context, state) => const CardScreen(),
  ),
  GoRoute(
    path: '/cards',
    name: ButtonsScreen.name,
    builder: (context, state) => const ButtonsScreen(),
  )
]);
