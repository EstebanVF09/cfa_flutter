import 'package:cfa_movil/utils/api_client/api_client.dart';
import 'package:cfa_movil/utils/api_client/api_client_impl.dart';
import 'package:get_it/get_it.dart';

void setUpDependencyInjectionUtils(GetIt getIt) {
  getIt.registerSingleton<ApiClient>(ApiClientImpl());
}
