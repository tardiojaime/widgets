import 'package:go_router/go_router.dart';
import 'package:widgets/presentation/screens/screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    builder: (context, state) => const CardScreen(),
  ),
  GoRoute(
    path: '/cards',
    builder: (context, state) => const ButtonsScreen(),
  )
]);
