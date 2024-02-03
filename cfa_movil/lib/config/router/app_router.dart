import 'package:cfa_movil/cubits/bottom_menu/bottom_menu_cubit.dart';
import 'package:cfa_movil/presentation/widgets/navigation/bottom_navigation_bar_widget.dart';
import 'package:cfa_movil/setup_dependency_injection/setup_dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => BottomNavigationBarWidget(
      menuCubit: getIt<BottomMenuCubit>(),
    ),
  ),
]);

class AppRouter extends Cubit<GoRouter> {
  AppRouter() : super(_appRouter);

  void goToHome() {
    state.go('/');
  }
}
