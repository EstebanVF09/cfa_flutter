import 'package:cfa_movil/config/environment/environment.dart';
import 'package:cfa_movil/utils/api_client/api_client.dart';
import 'package:cfa_movil/utils/api_client/api_client_impl.dart';
import 'package:cfa_movil/utils/connection_validator/connection_validator.dart';
import 'package:cfa_movil/utils/connection_validator/connection_validator_impl.dart';
import 'package:get_it/get_it.dart';

void setUpDependencyInjectionUtils(GetIt getIt) {
  getIt.registerSingleton<Environment>(Environment());
  getIt.registerSingleton<ApiClient>(ApiClientImpl());
  getIt.registerSingleton<ConnectionValidator>(ConnectionValidatorImpl());
}
