import 'package:cfa_movil/business_logic/datasource/catalogs/catalogs_datasource.dart';
import 'package:cfa_movil/business_logic/datasource/catalogs/catalogs_datasource_impl.dart';
import 'package:cfa_movil/config/environment/environment.dart';
import 'package:cfa_movil/utils/api_client/api_client.dart';
import 'package:get_it/get_it.dart';

void setUpDependencyInjectionDatasources(GetIt getIt) {
  getIt.registerLazySingleton<CatalogsDataSource>(() => CatalogsDataSourceImpl(
      clientHttp: getIt<ApiClient>(), environment: getIt<Environment>()));
}
