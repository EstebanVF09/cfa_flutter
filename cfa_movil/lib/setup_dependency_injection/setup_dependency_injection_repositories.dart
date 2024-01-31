import 'package:cfa_movil/business_logic/datasource/catalogs/catalogs_datasource.dart';
import 'package:cfa_movil/business_logic/repository/catalogs/catalogs_datasource_impl.dart';
import 'package:cfa_movil/business_logic/repository/catalogs/catalogs_repository.dart';
import 'package:get_it/get_it.dart';

void setUpDependencyInjectionRepositories(GetIt getIt) {
  getIt.registerLazySingleton<CatalogsRepository>(
      () => CatalogsRepositoryImpl(dataSource: getIt<CatalogsDataSource>()));
}
