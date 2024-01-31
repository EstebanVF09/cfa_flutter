import 'package:cfa_movil/presentation/screens/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
]);

class AppRouter extends Cubit<GoRouter> {
  AppRouter() : super(_appRouter);

  void goToHome() {
    state.go('/');
  }
  
}
