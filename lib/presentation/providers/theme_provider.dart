import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => true);
// lista de colores inmutable
final colorListProvider = Provider((ref) => colorList);
//Color seleccionado
final selectedColorProvider = StateProvider<int>((ref) => 0);
// para manejar estados - instancias de clases
// StateNotifierProvider<Controlador|notifier|administrador, tipo>
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller | Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // dentro tenemos acceso al state, desde la cual accedemos a todos
  // los atributos y metodos de la clase AppTheme
  ThemeNotifier() : super(AppTheme());
}
