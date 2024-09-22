import 'package:go_router/go_router.dart';
import 'package:widgets/presentation/screens/screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cards',
    name: CardScreen.name,
    builder: (context, state) => const CardScreen(),
  ),
  GoRoute(
    path: '/buttons',
    name: ButtonsScreen.name,
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: '/progress',
    name: ProgressScreen.name,
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    path: '/snackbars',
    name: SnackbarScreen.name,
    builder: (context, state) => const SnackbarScreen(),
  ),
  GoRoute(
    path: '/animated',
    name: AnimatedScreen.name,
    builder: (context, state) => const AnimatedScreen(),
  ),
  GoRoute(
    path: '/uicontrols',
    name: UiControlsScreen.name,
    builder: (context, state) => const UiControlsScreen(),
  ),
  GoRoute(
    path: '/tutorial',
    name: AppTutorialScreen.name,
    builder: (context, state) => const AppTutorialScreen(),
  ),
]);
