import 'package:cfa_movil/business_logic/datasource/catalogs/catalogs_datasource.dart';
import 'package:cfa_movil/business_logic/repository/catalogs/catalogs_repository_impl.dart';
import 'package:cfa_movil/business_logic/repository/catalogs/catalogs_repository.dart';
import 'package:cfa_movil/utils/connection_validator/connection_validator.dart';
import 'package:get_it/get_it.dart';

void setUpDependencyInjectionRepositories(GetIt getIt) {
  getIt.registerLazySingleton<CatalogsRepository>(() => CatalogsRepositoryImpl(
      dataSource: getIt<CatalogsDataSource>(),
      connectionValidator: getIt<ConnectionValidator>()));
}
