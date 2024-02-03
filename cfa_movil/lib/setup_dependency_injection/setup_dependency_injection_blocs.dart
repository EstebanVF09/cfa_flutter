import 'package:cfa_movil/blocs/home/home_bloc.dart';
import 'package:cfa_movil/business_logic/repository/catalogs/catalogs_repository.dart';
import 'package:cfa_movil/config/router/app_router.dart';
import 'package:cfa_movil/cubits/bottom_menu/bottom_menu_cubit.dart';
import 'package:get_it/get_it.dart';

void setUpDependencyInjectionBlocs(GetIt getIt) {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerLazySingleton<BottomMenuCubit>(() => BottomMenuCubit());
  getIt.registerSingleton<HomeBloc>(
      HomeBloc(repository: getIt<CatalogsRepository>()));
}
