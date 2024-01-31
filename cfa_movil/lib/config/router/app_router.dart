import 'package:cfa_movil/blocs/home/home_bloc.dart';
import 'package:cfa_movil/presentation/screens/home/home_screen.dart';
import 'package:cfa_movil/setup_dependency_injection/setup_dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => HomeScreen(
      homeBloc: getIt<HomeBloc>(),
    ),
  ),
]);

class AppRouter extends Cubit<GoRouter> {
  AppRouter() : super(_appRouter);

  void goToHome() {
    state.go('/');
  }
}
