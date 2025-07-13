import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:piero_morales_alcalde/home/home.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final isAdminRoute = state.fullPath?.startsWith('/admin') ?? false;

      // Si intenta acceder a una ruta de admin sin estar autenticado, redirigir
      // al home
      if (isAdminRoute && user == null) {
        return '/';
      }

      // Para cualquier otra ruta, permitir acceso
      return null;
    },
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
    debugLogDiagnostics: true,
  );
}
