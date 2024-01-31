import 'package:cfa_movil/blocs/home/home_bloc.dart';
import 'package:cfa_movil/config/router/app_router.dart';
import 'package:get_it/get_it.dart';

void setUpDependencyInjectionBlocs(GetIt getIt) {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<HomeBloc>(HomeBloc());
}
